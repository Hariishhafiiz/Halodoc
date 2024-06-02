// ignore_for_file: file_names, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:rekmed/view/widget/chat/ChatMessage.dart';
import 'package:rekmed/view/widget/chat/CustomAppBar.dart';
import 'package:rekmed/view/widget/chat/PresetResponseButtons.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  ChatScreenState createState() => ChatScreenState();
}

class ChatScreenState extends State<ChatScreen> {
  final List<ChatMessage> _messages = <ChatMessage>[];
  final TextEditingController _textController = TextEditingController();

  void _handleSubmitted(String text) {
    _textController.clear();
    ChatMessage message = ChatMessage(
      text: text,
    );
    setState(() {
      _messages.insert(0, message);
    });
  }

  Widget _buildTextComposer() {
    return IconTheme(
      data: IconThemeData(color: Theme.of(context).secondaryHeaderColor),
      child: Container(
        height: 72,
        margin: EdgeInsets.only(
          left: 15.0,
        ),
        child: Row(
          children: <Widget>[
            Expanded(
              child: Stack(
                alignment: Alignment.centerRight,
                children: [
                  TextField(
                    textAlignVertical: TextAlignVertical.center,
                    controller: _textController,
                    onSubmitted: _handleSubmitted,
                    decoration: InputDecoration(
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
                  )
                ],
              ),
            ),
            Container(
              alignment: Alignment.centerRight,
              padding: EdgeInsets.only(left: 15),
              child: IconButton(
                icon: Icon(
                  Icons.send,
                  color: Color(0xFFDF2155),
                ),
                onPressed: () => _handleSubmitted(_textController.text),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      body: Column(
        children: <Widget>[
          Flexible(
            child: ListView.builder(
              reverse: true,
              itemBuilder: (_, int index) => _messages[index],
              itemCount: _messages.length,
            ),
          ),
          Divider(height: 1.0),
          Container(
            decoration: BoxDecoration(
              color: Theme.of(context).cardColor,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                PresetResponseButtons(textController: _textController),
                _buildTextComposer(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
