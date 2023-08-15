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

  double _positionToValue(double value) {
    if (value < 0) {
      return 0;
    } else if (value > 1) {
      return 50;
    } else {
      return value * 50;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
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
                  textColor: Colors.blueAccent[700]!,
                  position: handsPosition,
                ),
                _buildIndicatorContainer(
                  color: Colors.green,
                  text: 'R',
                  textColor: Colors.greenAccent[100]!,
                  position: realPosition,
                ),
              ],
            ),
            Positioned(
              top: 0,
              bottom: 0,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: _buildMarks(),
              ),
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

  List<Widget> _buildMarks() {
    var result = <Widget>[];
    for (var i = 0; i < 5; i++) {
      result.add(Container(
        height: 1,
        width: i % 2 == 0 ? 15 : 5,
        color: Colors.black38,
      ));
    }
    return result;
  }

  Container _buildIndicatorContainer({
    required Color color,
    required String text,
    required Color textColor,
    required double position,
  }) {
    return Container(
      color: color,
      alignment: AlignmentDirectional.bottomCenter,
      height: _positionToValue(position),
      width: 10,
      child: Text(
        text,
        style: TextStyle(
          color: textColor,
          fontSize: 10,
        ),
      ),
    );
  }
}
