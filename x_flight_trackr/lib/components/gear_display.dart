import 'package:flutter/material.dart';

class GearDisplay extends StatelessWidget {
  final double gearPosition;

  const GearDisplay({required this.gearPosition, super.key});

  MaterialColor getGearColor() {
    if (gearPosition == 1) {
      return Colors.green;
    } else if (gearPosition == 0) {
      return Colors.red;
    } else {
      return Colors.amber;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text('Gear'),
            Container(
              height: 20,
              margin: const EdgeInsets.all(2),
              width: 20,
              decoration:
                  BoxDecoration(color: getGearColor(), shape: BoxShape.circle),
            ),
            Row(children: [
              Container(
                height: 20,
                margin: const EdgeInsets.all(2),
                width: 20,
                decoration: BoxDecoration(
                    color: getGearColor(), shape: BoxShape.circle),
              ),
              Container(
                height: 20,
                margin: const EdgeInsets.all(2),
                width: 20,
                decoration: BoxDecoration(
                    color: getGearColor(), shape: BoxShape.circle),
              ),
            ])
          ],
        ),
      ],
    );
  }
}
