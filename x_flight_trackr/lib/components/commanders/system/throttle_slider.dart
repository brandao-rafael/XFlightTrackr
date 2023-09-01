import 'package:flutter/material.dart';
import 'package:x_flight_trackr/components/commanders/system/painters/throttle_painter.dart';

class ThrottleSlider extends StatefulWidget {
  final ValueChanged<double> onChanged;

  const ThrottleSlider({Key? key, required this.onChanged}) : super(key: key);

  @override
  _ThrottleSliderState createState() => _ThrottleSliderState();
}

class _ThrottleSliderState extends State<ThrottleSlider> {
  double _currentValue = 0.0; // Idle position

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onVerticalDragUpdate: (details) {
        setState(() {
          double newValue =
              2 * (0.5 - details.localPosition.dy / context.size!.height);
          if (newValue < -1.0) {
            newValue = -1.0;
          } else if (newValue > 1.0) {
            newValue = 1.0;
          } else if (newValue < 0.05 && newValue > -0.05) {
            newValue = 0.0;
          }
          _currentValue = newValue;
          widget.onChanged(_currentValue);
        });
      },
      child: Column(
        children: [
          const Text('Throttle',
              style: TextStyle(
                fontSize: 10,
                color: Colors.grey,
              )),
          CustomPaint(
            size: Size(50, 200),
            painter: ThrottlePainter(_currentValue),
          ),
        ],
      ),
    );
  }
}
