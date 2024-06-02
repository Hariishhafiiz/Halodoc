// ignore_for_file: file_names, prefer_const_constructors, unnecessary_null_comparison

import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  final Size preferredSize;
  final String usernameChat;
  final String idChat;
  final bool showCallButton;
  final bool showProfileImage;
  final String profileImagePath;

  CustomAppBar({
    super.key,
    required this.usernameChat,
    required this.idChat,
    required this.showCallButton,
    required this.showProfileImage,
    required this.profileImagePath,
  }) : preferredSize = Size.fromHeight(72.0);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      toolbarHeight: preferredSize.height,
      backgroundColor: Color(0xFFDF2155),
      leading: IconButton(
        icon: Icon(Icons.arrow_back, color: Colors.white),
        onPressed: () {
          // Handle back button press
        },
      ),
      title: Row(
        children: [
          if (showProfileImage)
            Visibility(
              visible: showProfileImage,
              child: Container(
                height: 45,
                width: 45,
                child: CircleAvatar(
                  backgroundImage: profileImagePath.isNotEmpty
                      ? AssetImage(profileImagePath)
                      : null,
                ),
              ),
            ),
          if (showProfileImage) SizedBox(width: 12),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                usernameChat,
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 17,
                ),
              ),
              if (idChat != null && idChat.isNotEmpty)
                Text(
                  idChat,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                  ),
                ),
            ],
          ),
        ],
      ),
      actions: [
        if (showCallButton)
          IconButton(
            icon: Icon(Icons.call, color: Colors.white),
            onPressed: () {
              // Handle call button press
            },
          ),
      ],
    );
  }
}
