import 'package:flutter/material.dart';

class FlapPainter extends CustomPainter {
  final double value;

  FlapPainter(this.value);

  @override
  void paint(Canvas canvas, Size size) {
    final Paint trackPaint = Paint()
      ..color = Colors.grey[400]!
      ..strokeWidth = 10.0;

    final Paint thumbPaint = Paint()
      ..color = const Color.fromARGB(255, 128, 128, 119)
      ..strokeWidth = 20.0;

    final double thumbY = (1.0 - value) * size.height;

    // Draw track
    canvas.drawLine(Offset(size.width / 2, 0),
        Offset(size.width / 2, size.height), trackPaint);

    // Draw thumb as an arrow pointing to the left
    const double arrowSize = 15.0;
    final Path arrowPath = Path()
      ..moveTo(size.width / 2 - arrowSize, thumbY)
      ..lineTo(size.width - arrowSize * 1.3, thumbY - arrowSize)
      ..lineTo(size.width - arrowSize * 1.3, thumbY + arrowSize)
      ..close();
    canvas.drawPath(arrowPath, thumbPaint);

    // Draw markers and labels
    final Map<double, String> markerValues = {
      0.0: '0%',
      0.25: '25%',
      0.50: '50%',
      0.75: '75%',
      1.0: '100%'
    };

    for (double markerValue in markerValues.keys) {
      final double markerY = (1.0 - markerValue) * size.height;
      canvas.drawLine(
          Offset(size.width / 2 - arrowSize, markerY),
          Offset(size.width / 2 - arrowSize - 5, markerY),
          trackPaint..strokeWidth = 2.0);

      // Draw the label
      final textPainter = TextPainter(
        text: TextSpan(
            text: markerValues[markerValue],
            style: TextStyle(color: Colors.grey[400], fontSize: 8)),
        textDirection: TextDirection.ltr,
      );
      textPainter.layout();
      textPainter.paint(
          canvas,
          Offset(size.width / 2 - arrowSize - 10 - textPainter.width,
              markerY - textPainter.height / 2));
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
