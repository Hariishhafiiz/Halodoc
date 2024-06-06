import 'package:flutter/material.dart';
import 'package:rekmed/model/user/user_profile.dart';
import 'package:rekmed/service/database_service.dart';
import 'package:get_it/get_it.dart';
import 'package:dash_chat_2/dash_chat_2.dart';
import 'package:rekmed/service/auth_service.dart';
import 'package:rekmed/service/media_service.dart';
import 'package:rekmed/service/storage_service.dart';
import 'package:rekmed/utils/utils.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:io';
import 'package:rekmed/model/user/chat.dart';
import 'package:rekmed/model/user/massage.dart';
import 'package:rekmed/view/widget/chat/CustomAppBars.dart';

class ChatPage extends StatefulWidget {
  final UserProfile chatUser;

  const ChatPage({
    super.key,
    required this.chatUser,
  });

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  final GetIt _getIt = GetIt.instance;
  late MediaService _mediaService;
  late AuthService _authService;
  late DatabaseService _databaseService;
  late StorageService _storageService;

  ChatUser? currentUser, otherUser;

  @override
  void initState() {
    super.initState();
    _authService = _getIt.get<AuthService>();
    _databaseService = _getIt.get<DatabaseService>();
    _mediaService = _getIt.get<MediaService>();
    _storageService = _getIt.get<StorageService>();

    currentUser = ChatUser(
      id: _authService.user!.uid,
      firstName: _authService.user!.displayName,
      profileImage: _authService.user!.photoURL,
    );

    otherUser = ChatUser(
      id: widget.chatUser.uid!,
      firstName: widget.chatUser.name,
      profileImage: widget.chatUser.pfpURL,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        uid :widget.chatUser.uid!,
        name: widget.chatUser.name!,
        pfpURL: widget.chatUser.pfpURL ?? '',
      ),
      body: _buildUI(),
    );
  }

  Widget _buildUI() {
    return StreamBuilder(
      stream: _databaseService.getChatData(currentUser!.id, otherUser!.id),
      builder: (context, snapshot) {
        Chat? chat = snapshot.data?.data();
        List<ChatMessage> messages = [];
        if (chat != null && chat.messages != null) {
          messages = _generateChatMessagesList(chat.messages!);
        }

        return DashChat(
          messageOptions: MessageOptions(
            currentUserContainerColor: Color(0xFFDDEBFF),
            currentUserTextColor: Colors.white,
            //showCurrentUserAvatar: true,
            //showOtherUsersAvatar: true,
            messagePadding: EdgeInsets.symmetric(vertical: 13, horizontal: 20),
            messageDecorationBuilder: (ChatMessage msg, ChatMessage? previousMsg, ChatMessage? nextMsg) {
              bool isCurrentUser = msg.user.id == currentUser!.id;
              return BoxDecoration(
                
                color: isCurrentUser ? Color(0xFFDDEBFF) : Colors.grey[300],
                borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20.0), // Top left corner
                topRight: Radius.circular(20.0), // Top right corner
                bottomLeft: Radius.circular(20.0),),
                
                boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 0,
                  blurRadius: 4,
                  offset: Offset(0, 4),
                ),
              ],
              );
            },
            messageTextBuilder: (ChatMessage msg, ChatMessage? previousMsg, ChatMessage? nextMsg) {
              //bool isCurrentUser = msg.user.id == currentUser!.id;
              return Text(
                msg.text,
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black,
                ),
              );
            },
          ),
          inputOptions: InputOptions(
            alwaysShowSend: true,
            sendButtonBuilder: (onPressed) {
            return IconButton(
              icon: ImageIcon(
                  AssetImage('assets/vector.png'), 
                  color: Color(0xFFDF2155),
              ),
              onPressed: onPressed,
              );
            },
            inputDecoration: InputDecoration(
              contentPadding:
                        const EdgeInsets.symmetric(horizontal: 15.0),
                        border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(21.0)),
                        borderSide: BorderSide(color: Color(0xFF8E8E8E)),
                      ),
                      hintText: 'Masukkan pesan...',
                      hintStyle: TextStyle(
                        color: Colors.grey,
                        fontSize: 12,
                      ),
            ),
            trailing: [
              _mediaMessageButton(),
            ],
          ),
          currentUser: currentUser!,
          onSend: (chatMessage) => _sendMessage(chatMessage),
          messages: messages,
        );
      },
    );
  }

  Future<void> _sendMessage(ChatMessage chatMessage) async {
    if (chatMessage.medias?.isNotEmpty ?? false) {
      if (chatMessage.medias!.first.type == MediaType.image) {
        Message message = Message(
          senderID: chatMessage.user.id,
          content: chatMessage.medias!.first.url,
          messageType: MessageType.Image,
          sentAt: Timestamp.fromDate(chatMessage.createdAt),
        );
        await _databaseService.sendChatMessage(
          currentUser!.id,
          otherUser!.id,
          message,
        );
      }
    } else {
      Message message = Message(
        senderID: currentUser!.id,
        content: chatMessage.text,
        messageType: MessageType.Text,
        sentAt: Timestamp.fromDate(chatMessage.createdAt),
      );

      await _databaseService.sendChatMessage(
        currentUser!.id,
        otherUser!.id,
        message,
      );
    }
  }

  List<ChatMessage> _generateChatMessagesList(List<Message> messages) {
    List<ChatMessage> chatMessages = messages.map((m) {
      if (m.messageType == MessageType.Image) {
        return ChatMessage(
          user: m.senderID == currentUser!.id ? currentUser! : otherUser!,
          createdAt: m.sentAt!.toDate(),
          medias: [
            ChatMedia(
              url: m.content!,
              fileName: "",
              type: MediaType.image,
            ),
          ],
        );
      } else {
        return ChatMessage(
          user: m.senderID == currentUser!.id ? currentUser! : otherUser!,
          text: m.content!,
          createdAt: m.sentAt!.toDate(),
        );
      }
    }).toList();

    chatMessages.sort((a, b) {
      return b.createdAt.compareTo(a.createdAt);
    });

    return chatMessages;
  }

  Widget _mediaMessageButton() {
    return IconButton(
      onPressed: () async {
        File? file = await _mediaService.getImageFromGallery();
        if (file != null) {
          String chatID = generateChatID(
            uid1: currentUser!.id,
            uid2: otherUser!.id,
          );
          String? downloadURL = await _storageService.uploadImageToChat(
            file: file,
            chatID: chatID,
          );
          if (downloadURL != null) {
            ChatMessage chatMessage = ChatMessage(
              user: currentUser!,
              createdAt: DateTime.now(),
              medias: [
                ChatMedia(
                  url: downloadURL,
                  fileName: "",
                  type: MediaType.image,
                ),
              ],
            );
            _sendMessage(chatMessage);
          }
        }
      },
      icon: Icon(
        Icons.image,
        color: Theme.of(context).colorScheme.primary,
      ),
    );
  }
}
