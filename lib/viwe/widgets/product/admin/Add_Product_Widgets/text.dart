import 'package:flutter/material.dart';

class TextU extends StatelessWidget {
  final String text;

  TextU(
      {Key? key,
        required this.text,
      })
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Text(
        text,
        style:
          TextStyle(
            color: Colors.grey.shade800,
            fontSize: 16,
            fontWeight: FontWeight.w400,
          ),

    );
  }
}