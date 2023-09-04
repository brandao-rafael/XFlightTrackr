import 'package:flutter/material.dart';

class VerticalLine extends StatelessWidget {
  final Color color;
  final double width;
  const VerticalLine({super.key, this.color = Colors.white, this.width = 50});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 1,
      height: width,
      color: color,
      margin: const EdgeInsets.symmetric(horizontal: 8.0),
    );
  }
}
