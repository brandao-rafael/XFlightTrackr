import 'package:flutter/material.dart';

class FlapsDisplay extends StatelessWidget {
  final double handflapsPosition;
  final double flapsPosition;
  const FlapsDisplay(
      {super.key,
      required this.handflapsPosition,
      required this.flapsPosition});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text('Flaps'),
        Stack(
          alignment: AlignmentDirectional.bottomCenter,
          children: [
            Container(
              color: Colors.white,
              height: 50,
              width: 10,
            ),
            Container(
              color: Colors.amber,
              height: handflapsPosition * 50,
              width: 10,
            ),
            Container(
              color: Colors.green,
              height: flapsPosition * 50,
              width: 10,
            )
          ],
        )
      ],
    );
  }
}
