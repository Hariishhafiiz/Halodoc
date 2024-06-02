// ignore_for_file: file_names, prefer_const_constructors

import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  final Size preferredSize;

  CustomAppBar({super.key}) : preferredSize = Size.fromHeight(72.0);

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
          // ignore: sized_box_for_whitespace
          Container(
            height: 45,
            width: 45,
            child: CircleAvatar(
                //backgroundImage: AssetImage(), // Replace with actual image path
                ),
          ),
          SizedBox(width: 12),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text(
                'Hermione Granger',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'CustomFont',
                  fontSize: 17,
                ),
              ),
              Text(
                'AB1234CDE',
                style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'CustomFont',
                    fontSize: 12),
              ),
            ],
          ),
        ],
      ),
      actions: [
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
