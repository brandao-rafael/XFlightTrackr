import 'package:flutter/material.dart';

class GearDisplay extends StatelessWidget {
  final double gearPosition;

  const GearDisplay({
    Key? key,
    required this.gearPosition,
  }) : super(key: key);

  String get _gearColor {
    if (gearPosition == 1) {
      return 'lib/assets/icons/box_green.png';
    } else if (gearPosition == 0) {
      return 'lib/assets/icons/box_red.png';
    } else {
      return 'lib/assets/icons/box_yellow.png';
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
      child: Image.asset(
        _gearColor,
        width: 20,
      ),
    );
  }
}
