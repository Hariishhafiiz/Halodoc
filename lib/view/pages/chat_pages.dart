import 'dart:async';

import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';
import 'package:flutter_background/flutter_background.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

import 'package:my_app/models/user/user_profile.dart';
import 'package:my_app/services/database_service.dart';
import 'package:get_it/get_it.dart';
import 'package:dash_chat_2/dash_chat_2.dart';
import 'package:my_app/services/auth_service.dart';
import 'package:my_app/services/media_service.dart';
import 'package:my_app/services/storage_service.dart';
import 'package:my_app/utils/utils.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:io';
import 'package:my_app/models/user/chat.dart';
import 'package:my_app/models/user/massage.dart';
import 'package:my_app/view/widget/chat/CustomAppBars.dart';

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

    enableBackground();

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

    Timer(const Duration(minutes: 2), () async {
      AwesomeNotifications().createNotification(
        content: NotificationContent(
          id: 10,
          channelKey: 'basic_channel',
          actionType: ActionType.Default,
          title: 'Peringatan!',
          body: 'Anda belum melakukan konsultasi dengan pasien, segera lakukan konsultasi sekarang',
        ),
      );
    });
  }

  Future<void> enableBackground() async {
    await FlutterBackground.enableBackgroundExecution();

    AwesomeNotifications().initialize(
        null,
        [
          NotificationChannel(
              channelGroupKey: 'basic_channel_group',
              channelKey: 'basic_channel',
              channelName: 'Basic notifications',
              channelDescription: 'Notification channel for basic tests',
              defaultColor: const Color(0xFF9D50DD),
              ledColor: Colors.white)
        ],
        // Channel groups are only visual and are not required
        channelGroups: [
          NotificationChannelGroup(
              channelGroupKey: 'basic_channel_group', channelGroupName: 'Basic group')
        ],
        debug: true);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        uid: widget.chatUser.uid!,
        name: widget.chatUser.name!,
        pfpURL: widget.chatUser.pfpURL ?? '',
      ),
      body: _buildUI(),
    );
  }

  Widget _buildUI() {
    return StreamBuilder(
      stream: widget.chatUser.role == 'doctor'
          ? _databaseService.getDoctorChatData(currentUser!.id, otherUser!.id)
          : _databaseService.getChatData(currentUser!.id, otherUser!.id),
      builder: (context, snapshot) {
        Chat? chat = snapshot.data?.data();
        List<ChatMessage> messages = [];
        if (chat != null && chat.messages != null) {
          messages = _generateChatMessagesList(chat.messages!);
        }

        return DashChat(
          messageOptions: MessageOptions(
            currentUserContainerColor: const Color(0xFFDDEBFF),
            currentUserTextColor: Colors.white,
            // showCurrentUserAvatar: true,
            // showOtherUsersAvatar: true,
            messagePadding: const EdgeInsets.symmetric(vertical: 13, horizontal: 20),
            messageDecorationBuilder:
                (ChatMessage msg, ChatMessage? previousMsg, ChatMessage? nextMsg) {
              bool isCurrentUser = msg.user.id == currentUser!.id;
              return BoxDecoration(
                color: isCurrentUser ? const Color(0xFFDDEBFF) : Colors.grey[300],
                borderRadius: BorderRadius.only(
                    topLeft: const Radius.circular(20.0), // Top left corner
                    topRight: const Radius.circular(20.0), // Top right corner
                    bottomLeft: isCurrentUser
                        ? const Radius.circular(20.0)
                        : const Radius.circular(0),
                    bottomRight: isCurrentUser
                        ? const Radius.circular(0)
                        : const Radius.circular(20.0) // Bottom right corner
                    ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 0,
                    blurRadius: 2,
                    offset: const Offset(0, 2),
                  ),
                ],
              );
            },
            messageTextBuilder:
                (ChatMessage msg, ChatMessage? previousMsg, ChatMessage? nextMsg) {
              //bool isCurrentUser = msg.user.id == currentUser!.id;
              return Text(
                msg.text,
                style: const TextStyle(
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
                icon: const ImageIcon(
                  AssetImage('assets/vector.png'),
                  color: Color(0xFFDF2155),
                ),
                onPressed: onPressed,
              );
            },
            inputDecoration: const InputDecoration(
              contentPadding: EdgeInsets.symmetric(horizontal: 15.0),
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
        MessageObj message = MessageObj(
          senderID: chatMessage.user.id,
          content: chatMessage.medias!.first.url,
          messageType: MessageType.Image,
          sentAt: Timestamp.fromDate(chatMessage.createdAt),
        );

        if (widget.chatUser.role == 'doctor') {
          await _databaseService.sendDoctorChatMessage(
            currentUser!.id,
            otherUser!.id,
            message,
          );
        } else {
          await _databaseService.sendChatMessage(
            currentUser!.id,
            otherUser!.id,
            message,
          );
        }
      }
    } else {
      MessageObj message = MessageObj(
        senderID: currentUser!.id,
        content: chatMessage.text,
        messageType: MessageType.Text,
        sentAt: Timestamp.fromDate(chatMessage.createdAt),
      );

      if (widget.chatUser.role == 'doctor') {
        await _databaseService.sendDoctorChatMessage(
          currentUser!.id,
          otherUser!.id,
          message,
        );
      } else {
        await _databaseService.sendChatMessage(
          currentUser!.id,
          otherUser!.id,
          message,
        );
      }
    }
  }

  List<ChatMessage> _generateChatMessagesList(List<MessageObj> messages) {
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

    chatMessages.sort((b, a) {
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
