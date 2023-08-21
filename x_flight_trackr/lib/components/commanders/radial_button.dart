import 'package:flutter/material.dart';

class RadialButton extends StatelessWidget {
  final String? text;
  final IconData icon;

  const RadialButton({required this.icon, this.text, super.key});

  final double radius = 20.0;

  void _panHandler(DragUpdateDetails d) {
    /// Pan location on the wheel
    bool onTop = d.localPosition.dy <= radius;
    bool onLeftSide = d.localPosition.dx <= radius;
    bool onRightSide = !onLeftSide;
    bool onBottom = !onTop;

    /// Pan movements
    bool panUp = d.delta.dy <= 0.0;
    bool panLeft = d.delta.dx <= 0.0;
    bool panRight = !panLeft;
    bool panDown = !panUp;

    /// Absoulte change on axis
    double yChange = d.delta.dy.abs();
    double xChange = d.delta.dx.abs();

    /// Directional change on wheel
    double verticalRotation = (onRightSide && panDown) || (onLeftSide && panUp)
        ? yChange
        : yChange * -1;

    double horizontalRotation =
        (onTop && panRight) || (onBottom && panLeft) ? xChange : xChange * -1;

    // Total computed change
    double rotationalChange = verticalRotation + horizontalRotation;

    bool movingClockwise = rotationalChange > 0;
    bool movingCounterClockwise = rotationalChange < 0;

    print(movingClockwise);
    print(movingCounterClockwise);
    print(rotationalChange);

    // Now do something interesting with these computations!
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (text != null)
          Text(text!, style: TextStyle(fontSize: 10, color: Colors.grey[300]!)),
        const SizedBox(height: 5),
        GestureDetector(
          onPanUpdate: _panHandler,
          child: Container(
            height: radius * 2,
            width: radius * 2,
            decoration: BoxDecoration(
              color: Colors.black38,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.5),
                  spreadRadius: 3,
                  blurRadius: 3,
                  offset: const Offset(0, 1),
                )
              ],
              borderRadius: BorderRadius.circular(100),
              border: Border.all(
                color: Colors.grey,
                width: 1,
              ),
            ),
            child: Icon(icon, size: 15, color: Colors.grey[400]),
          ),
        ),
      ],
    );
  }
}
