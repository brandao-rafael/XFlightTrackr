import 'package:flutter/material.dart';

class HorizontalLine extends StatelessWidget {
  final Color color;
  const HorizontalLine({Key? key, this.color = Colors.white}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 1,
      color: color,
      margin: const EdgeInsets.symmetric(vertical: 2.0),
    );
  }
}
