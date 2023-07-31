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
              color: Colors.white70,
              height: 50,
              width: 20,
            ),
            Row(
              children: [
                Container(
                  color: Colors.blue[100],
                  alignment: AlignmentDirectional.center,
                  height: (handsPosition * 50) > 50 ? 50 : handsPosition * 50,
                  width: 10,
                  child: const Text(
                    'R',
                  ),
                ),
                Container(
                  color: Colors.green,
                  alignment: AlignmentDirectional.center,
                  height: (realPosition * 50) > 50 ? 50 : realPosition * 50,
                  width: 10,
                  child: const Text(
                    'H',
                  ),
                )
              ],
            )
          ],
        )
      ],
    );
  }
}
