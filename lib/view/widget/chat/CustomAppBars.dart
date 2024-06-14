import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String uid;
  final String name;
  final String pfpURL;

  const CustomAppBar({
    super.key,
    required this.uid,
    required this.name,
    required this.pfpURL,
  }) : preferredSize = const Size.fromHeight(82.0);

  @override
  final Size preferredSize;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: const Color(0xFFDF2155),
      leading: IconButton(
        padding: const EdgeInsets.only(top: 27),
        icon: const Icon(Icons.arrow_back, color: Colors.white),
        onPressed: () {
          Navigator.pop(context); 
        },
      ),
      title: Padding(
        padding: const EdgeInsets.only(top: 22.0),
        child: Row(
          children: [
            SizedBox(
              height: 45,
              width: 45,
              child: CircleAvatar(
                backgroundImage: NetworkImage(pfpURL),
              ),
            ),
            const SizedBox(width: 12),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'CustomFont',
                    fontSize: 17,
                  ),
                ),
                Text(
                  uid,
                  style: const TextStyle(
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
            icon: const Icon(Icons.call, color: Colors.white),
            onPressed: () {
              // Handle call button press
            },
          ),
        ),
      ],
    );
  }
}
