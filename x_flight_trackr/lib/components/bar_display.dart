import 'package:flutter/material.dart';

class BarDisplay extends StatelessWidget {
  final String title;
  final double handsPosition;
  final double realPosition;
  const BarDisplay(
      {super.key,
      required this.handsPosition,
      required this.realPosition,
      required this.title});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title),
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
              height: handsPosition * 50,
              width: 10,
            ),
            Container(
              color: Colors.green,
              height: realPosition * 50,
              width: 10,
            )
          ],
        )
      ],
    );
  }
}
