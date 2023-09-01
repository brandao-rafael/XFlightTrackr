import 'dart:math';

import 'package:flutter/material.dart';

class RotaryPainter extends CustomPainter {
  final double angle;
  static const List<String> positions = ['RTO', 'OFF', '1', '2', '3', '4', '5'];

  RotaryPainter(this.angle);

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final currentAngle = angle + pi / 2;

    final double mainRadius = size.width * 0.4; // 40% of width
    final double borderInnerRadius = mainRadius * 0.70;
    final double borderOuterRadius = mainRadius * 0.75;
    final double markerLength = mainRadius * 0.125;
    final double textOffset = mainRadius * 1.29;
    final double textSize = size.width * 0.07;

    // Draw the gray circle
    canvas.drawCircle(center, mainRadius, Paint()..color = Colors.grey[600]!);
    canvas.drawCircle(center, mainRadius - 2, Paint()..color = Colors.grey);
    canvas.drawCircle(
        center, borderOuterRadius, Paint()..color = Colors.grey[100]!);
    canvas.drawCircle(
        center, borderInnerRadius, Paint()..color = Colors.grey[800]!);

    // Draw position markers for each of the 7 positions
    for (int i = 0; i < 7; i++) {
      final markerAngle = pi / 2 + i * pi / 6;
      final start = Offset(center.dx + mainRadius * cos(markerAngle),
          center.dy + mainRadius * sin(markerAngle));
      final end = Offset(
          center.dx + (mainRadius + markerLength) * cos(markerAngle),
          center.dy + (mainRadius + markerLength) * sin(markerAngle));
      canvas.drawLine(start, end, Paint()..strokeWidth = 3.0);

      final indexPosition = Offset(center.dx + textOffset * cos(markerAngle),
          center.dy + textOffset * sin(markerAngle));
      final textPainter = TextPainter(
        text: TextSpan(
            text: positions[i],
            style: TextStyle(color: Colors.black, fontSize: textSize)),
        textDirection: TextDirection.ltr,
      );
      textPainter.layout();
      textPainter.paint(
          canvas,
          indexPosition -
              Offset(textPainter.width / 2, textPainter.height / 2));
    }

    // Draw the rotary switcher based on the current angle
    final end = Offset(center.dx + mainRadius * cos(currentAngle),
        center.dy + mainRadius * sin(currentAngle));
    canvas.drawLine(
        center,
        end,
        Paint()
          ..color = Colors.white
          ..strokeWidth = 7);
    canvas.drawLine(center, end, Paint()..strokeWidth = 5.0);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
