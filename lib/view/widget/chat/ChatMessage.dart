// ignore_for_file: file_names, prefer_const_constructors

import 'package:flutter/material.dart';

class ChatMessage extends StatelessWidget {
  final String text;

  const ChatMessage({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 13.0),
      child: Row(
        mainAxisAlignment:
            MainAxisAlignment.end, // Align row items to the right
        children: <Widget>[
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 13.0),
            decoration: BoxDecoration(
              color: Color(0xFFDDEBFF), // Light blue background
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20.0), // Top left corner
                topRight: Radius.circular(20.0), // Top right corner
                bottomLeft: Radius.circular(20.0), // Bottom left corner
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 0,
                  blurRadius: 4,
                  offset: Offset(0, 4), // changes position of shadow
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                Text(
                  text,
                  style: TextStyle(
                    fontSize: 16, // Larger font size
                    color: Colors.black, // Text color
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
