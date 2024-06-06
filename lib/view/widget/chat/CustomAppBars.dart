import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String uid;
  final String name;
  final String pfpURL;

  CustomAppBar({
    super.key,
    required this.uid,
    required this.name,
    required this.pfpURL,
  }) : preferredSize = Size.fromHeight(82.0);

  @override
  final Size preferredSize;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Color(0xFFDF2155),
      leading: IconButton(
        padding: EdgeInsets.only(top: 27),
        icon: Icon(Icons.arrow_back, color: Colors.white),
        onPressed: () {
          Navigator.pop(context); 
        },
      ),
      title: Padding(
        padding: const EdgeInsets.only(top: 22.0),
        child: Row(
          children: [
            Container(
              height: 45,
              width: 45,
              child: CircleAvatar(
                backgroundImage: NetworkImage(pfpURL),
              ),
            ),
            SizedBox(width: 12),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'CustomFont',
                    fontSize: 17,
                  ),
                ),
                Text(
                  uid,
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'CustomFont',
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.only(top: 20),
          child: IconButton(
            icon: Icon(Icons.call, color: Colors.white),
            onPressed: () {
              // Handle call button press
            },
          ),
        ),
      ],
    );
  }
}
