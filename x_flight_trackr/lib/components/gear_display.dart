import 'package:flutter/material.dart';

class GearDisplay extends StatelessWidget {
  final double gearPosition;

  const GearDisplay({
    Key? key,
    required this.gearPosition,
  }) : super(key: key);

  MaterialColor get _gearColor {
    if (gearPosition == 1) {
      return Colors.green;
    } else if (gearPosition == 0) {
      return Colors.red;
    } else {
      return Colors.yellow;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Text('Gear'),
        _buildCircleIndicator(),
        Row(children: [
          _buildCircleIndicator(),
          _buildCircleIndicator(),
        ])
      ],
    );
  }

  Container _buildCircleIndicator() {
    return Container(
      height: 22,
      margin: const EdgeInsets.all(2),
      width: 20,
      decoration: BoxDecoration(
        color: _gearColor,
        shape: BoxShape.circle,
      ),
    );
  }
}
