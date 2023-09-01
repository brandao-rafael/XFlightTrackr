import 'package:flutter/material.dart';

class ThrottlePainter extends CustomPainter {
  final double value;

  ThrottlePainter(this.value);

  @override
  void paint(Canvas canvas, Size size) {
    final Paint trackPaint = Paint()
      ..color = Colors.grey[400]!
      ..strokeWidth = 10.0;

    final Paint revTrackPaint = Paint()
      ..color = Colors.grey[800]!
      ..strokeWidth = 10.0;

    final Paint thumbPaint = Paint()
      ..color = Colors.blue
      ..strokeWidth = 20.0;

    final double thumbY = size.height * (0.5 - value / 2);

    // Draw track
    canvas.drawLine(Offset(size.width / 2, 0),
        Offset(size.width / 2, size.height), revTrackPaint);
    canvas.drawLine(Offset(size.width / 2, 0),
        Offset(size.width / 2, size.height / 2), trackPaint);

    // Draw thumb as a rectangle
    const double thumbHeight = 20.0;
    const double thumbWidth = 30.0;
    final Rect thumbRect = Rect.fromCenter(
      center: Offset(size.width / 2, thumbY),
      width: thumbWidth,
      height: thumbHeight,
    );
    canvas.drawRect(thumbRect, thumbPaint);

    // Draw markers and labels
    final Map<double, String> markerValues = {
      1.0: 'MAX',
      0.75: 'TOGA',
      0.0: 'IDLE',
      -1.0: 'REV'
    };

    for (double markerValue in markerValues.keys) {
      final double markerY = size.height * (0.5 - markerValue / 2);
      canvas.drawLine(
          Offset(size.width / 2 - thumbWidth / 2, markerY),
          Offset(size.width / 2 - thumbWidth / 2 - 5, markerY),
          trackPaint..strokeWidth = 2.0);

      // Draw the label
      final textPainter = TextPainter(
        text: TextSpan(
            text: markerValues[markerValue],
            style: const TextStyle(color: Colors.black, fontSize: 8)),
        textDirection: TextDirection.ltr,
      );
      textPainter.layout();
      textPainter.paint(
          canvas,
          Offset(size.width / 2 - thumbWidth / 2 - 10 - textPainter.width,
              markerY - textPainter.height / 2));
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
