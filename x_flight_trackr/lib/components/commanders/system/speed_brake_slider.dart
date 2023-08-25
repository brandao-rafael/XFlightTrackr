import 'package:flutter/material.dart';
import 'package:x_flight_trackr/components/commanders/system/speed_brake_painter.dart';

class SpeedBrakeSlider extends StatefulWidget {
  final ValueChanged<double> onChanged;

  const SpeedBrakeSlider({super.key, required this.onChanged});

  @override
  _SpeedBrakeSliderState createState() => _SpeedBrakeSliderState();
}

class _SpeedBrakeSliderState extends State<SpeedBrakeSlider> {
  double _currentValue = 0.0;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onVerticalDragUpdate: (details) {
        setState(() {
          double newValue =
              1.0 - (details.localPosition.dy / context.size!.height);
          if (newValue < 0.0) {
            newValue = -0.5;
          } else if (newValue < 0.05) {
            newValue = 0.0;
          } else if (newValue > 1.0) {
            newValue = 1.0;
          }
          _currentValue = newValue;
          widget.onChanged(_currentValue);
        });
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text('Speed Brake',
              style: TextStyle(
                fontSize: 10,
                color: Colors.grey,
              )),
          const SizedBox(height: 10),
          CustomPaint(
            size: const Size(50, 150),
            painter: SpeedBrakePainter(_currentValue),
          ),
        ],
      ),
    );
  }
}
