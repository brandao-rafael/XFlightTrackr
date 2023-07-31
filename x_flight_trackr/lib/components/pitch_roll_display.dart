import 'package:flutter/material.dart';

class PitRollDisplay extends StatelessWidget {
  final double pitch;
  final double roll;

  const PitRollDisplay({super.key, required this.pitch, required this.roll});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Pitch: ${pitch.toStringAsFixed(0)}°'),
        Text('Roll: ${roll.toStringAsFixed(0)}°'),
      ],
    );
  }
}
