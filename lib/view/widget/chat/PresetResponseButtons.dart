// ignore_for_file: file_names, prefer_const_constructors_in_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'PresetResponseButton.dart';

class PresetResponseButtons extends StatelessWidget {
  final TextEditingController textController;

  PresetResponseButtons({super.key, required this.textController});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 6, left: 15),
      height: 49.0,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: <Widget>[
          PresetResponseButton(text: "Hallo", textController: textController),
          PresetResponseButton(
              text: "Ya, pesanan sudah sesuai.",
              textController: textController),
          PresetResponseButton(
              text: "Terima kasih", textController: textController),
        ],
      ),
    );
  }
}
