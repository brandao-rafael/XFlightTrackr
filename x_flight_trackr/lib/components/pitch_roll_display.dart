import 'package:flutter/material.dart';

class PitRollDisplay extends StatelessWidget {
  final double pitch;
  final double roll;

  const PitRollDisplay({
    Key? key,
    required this.pitch,
    required this.roll,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildDisplayText('Pitch', pitch),
        _buildDisplayText('Roll', roll),
      ],
    );
  }

  Text _buildDisplayText(String label, double value) {
    return Text('$label: ${value.toStringAsFixed(0)}°');
  }
}
