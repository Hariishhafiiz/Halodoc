// ignore_for_file: file_names, prefer_const_constructors

import 'package:flutter/material.dart';

class PresetResponseButton extends StatelessWidget {
  final String text;
  final TextEditingController textController;

  const PresetResponseButton(
      {super.key, required this.text, required this.textController});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 8),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(18.0),
            side: BorderSide(color: Color(0xFF8E8E8E)),
          ),
        ),
        onPressed: () {
          // Handle preset response button press
          textController.text = text;
        },
        child: Text(
          text,
          style: TextStyle(color: Colors.black, fontSize: 12),
        ),
      ),
    );
  }
}
