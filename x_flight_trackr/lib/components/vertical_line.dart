import 'package:flutter/material.dart';

class VerticalLine extends StatelessWidget {
  const VerticalLine({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 1,
      height: 50,
      color: Colors.white,
      margin: const EdgeInsets.symmetric(horizontal: 8.0),
    );
  }
}
