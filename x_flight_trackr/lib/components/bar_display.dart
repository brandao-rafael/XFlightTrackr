import 'package:flutter/material.dart';

class BarDisplay extends StatelessWidget {
  final String title;
  final double handsPosition;
  final double realPosition;

  const BarDisplay({
    Key? key,
    required this.handsPosition,
    required this.realPosition,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title),
        Stack(
          alignment: AlignmentDirectional.bottomCenter,
          children: [
            _buildBarContainer(),
            Row(
              children: [
                _buildIndicatorContainer(
                  color: Colors.blue[100]!,
                  text: 'H',
                  textColor: Colors.blue,
                  position: handsPosition,
                ),
                _buildIndicatorContainer(
                  color: Colors.green,
                  text: 'R',
                  textColor: Colors.greenAccent,
                  position: realPosition,
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }

  Container _buildBarContainer() {
    return Container(
      color: Colors.white70,
      height: 50,
      width: 20,
    );
  }

  Container _buildIndicatorContainer({
    required Color color,
    required String text,
    required Color textColor,
    required double position,
  }) {
    return Container(
      color: color,
      alignment: AlignmentDirectional.center,
      height: (position * 50) > 50 ? 50 : position * 50,
      width: 10,
      child: Text(
        text,
        style: TextStyle(color: textColor),
      ),
    );
  }
}
