import 'package:flutter/material.dart';

class BlackText extends StatelessWidget {
  final String text;
  const BlackText(this.text, {super.key});

  @override
  Widget build(BuildContext context) {
    return Text(text, style: const TextStyle(color: Colors.black));
  }
}
