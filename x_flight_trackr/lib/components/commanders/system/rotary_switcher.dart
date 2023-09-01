import 'dart:math';

import 'package:flutter/material.dart';
import 'package:x_flight_trackr/components/commanders/system/painters/rotary_painter.dart';

class RotarySwitcher extends StatefulWidget {
  final ValueChanged<int> onChanged;

  const RotarySwitcher({super.key, required this.onChanged});

  @override
  _RotarySwitcherState createState() => _RotarySwitcherState();
}

class _RotarySwitcherState extends State<RotarySwitcher> {
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
      child: CustomPaint(
        size: const Size(100, 100),
        painter: RotaryPainter(_currentAngle),
      ),
    );
  }
}
