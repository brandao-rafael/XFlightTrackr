import 'dart:math';

import 'package:flutter/material.dart';
import 'package:x_flight_trackr/components/commanders/system/painters/rotary_painter.dart';

class AutoBrakeRotarySwitcher extends StatefulWidget {
  final ValueChanged<int> onChanged;

  const AutoBrakeRotarySwitcher({super.key, required this.onChanged});

  @override
  _AutoBrakeRotarySwitcherState createState() =>
      _AutoBrakeRotarySwitcherState();
}

class _AutoBrakeRotarySwitcherState extends State<AutoBrakeRotarySwitcher> {
  double _currentAngle = 0;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onPanUpdate: (details) {
        setState(() {
          _currentAngle = atan2(
              details.localPosition.dy - 100, details.localPosition.dx - 100);
        });
      },
      onPanEnd: (details) {
        int position = (_currentAngle / (pi / 6)).round();
        if (position < 0) position = 0;
        if (position > 6) position = 6;
        setState(() {
          _currentAngle = position * pi / 6;
        });
        widget.onChanged(position);
      },
      child: Column(
        children: [
          const Text('Auto Brake',
              style: TextStyle(
                fontSize: 10,
                color: Colors.grey,
              )),
          const SizedBox(height: 10),
          CustomPaint(
            size: const Size(80, 80),
            painter: RotaryPainter(_currentAngle),
          ),
        ],
      ),
    );
  }
}
