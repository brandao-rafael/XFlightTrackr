import 'package:flutter/material.dart';

class RadialButton extends StatelessWidget {
  final IconData? icon;
  final double radius;
  final void Function(DragUpdateDetails) onPanUpdate;

  const RadialButton({
    this.icon,
    super.key,
    required this.radius,
    required this.onPanUpdate,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onPanUpdate: onPanUpdate,
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
            child: Icon(icon, size: 30, color: Colors.grey[400]!),
          ),
        ),
      ],
    );
  }
}
