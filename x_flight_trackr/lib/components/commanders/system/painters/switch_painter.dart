import 'package:flutter/material.dart';

class SwitcherPainter extends CustomPainter {
  final int value;
  final String? up;
  final String? down;

  SwitcherPainter(this.value, {this.up = 'UP', this.down = 'DOWN'});

  @override
  void paint(Canvas canvas, Size size) {
    final Paint trackPaint = Paint()
      ..color = Colors.grey[400]!
      ..strokeWidth = 10.0;

    final Paint thumbPaint = Paint()
      ..color = const Color.fromARGB(255, 128, 128, 119)
      ..strokeWidth = 20.0;

    final Paint switcherRolePaint = Paint()
      ..color = Colors.grey[800]!
      ..strokeWidth = 20.0;

    final Paint stemPaint = Paint()
      ..color = Colors.grey[500]!
      ..strokeWidth = 20.0;

    final double thumbY = value == 0 ? size.height * 0.1 : size.height * 0.9;

    // Draw track (base of the switcher)
    canvas.drawRRect(
      RRect.fromRectAndRadius(
        Rect.fromCenter(
          center: Offset(size.width / 2, size.height / 2),
          width: size.width * 0.7,
          height: size.height * 0.8,
        ),
        const Radius.circular(20.0),
      ),
      trackPaint,
    );

    canvas.drawRRect(
      RRect.fromRectAndRadius(
        Rect.fromCenter(
          center: Offset(size.width / 2, size.height / 2),
          width: size.width * 0.5,
          height: size.height * 0.6,
        ),
        const Radius.circular(20.0),
      ),
      switcherRolePaint,
    );

    // stem
    canvas.drawRRect(
      RRect.fromRectAndRadius(
        Rect.fromCenter(
          center: Offset(size.width / 2, size.height / (value == 1 ? 1.5 : 3)),
          width: size.width * 0.2,
          height: size.height * 0.4,
        ),
        const Radius.circular(4.0),
      ),
      stemPaint,
    );

    // Draw labels like markers
    final textPainterOff = TextPainter(
      text: TextSpan(
          text: up, style: const TextStyle(color: Colors.black, fontSize: 10)),
      textDirection: TextDirection.ltr,
    );
    textPainterOff.layout();
    textPainterOff.paint(canvas,
        Offset((size.width - textPainterOff.width) / 2, size.height * -0.05));

    final textPainterOn = TextPainter(
      text: TextSpan(
          text: down,
          style: const TextStyle(color: Colors.black, fontSize: 10)),
      textDirection: TextDirection.ltr,
    );
    textPainterOn.layout();
    textPainterOn.paint(
        canvas,
        Offset((size.width - textPainterOn.width) / 2,
            size.height - textPainterOn.height - size.height * -0.05));

    // Draw thumb as a circle (switcher handle)
    canvas.drawCircle(
        Offset(size.width / 2, thumbY), size.width * 0.3, thumbPaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
