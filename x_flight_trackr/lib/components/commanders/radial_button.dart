import 'package:flutter/material.dart';

class RadialButton extends StatelessWidget {
  final String? text;
  final String? value;
  final IconData? icon;
  final double radius;
  final void Function(DragUpdateDetails) onPanUpdate;

  const RadialButton({
    this.icon,
    this.text,
    super.key,
    required this.radius,
    required this.onPanUpdate,
    this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (text != null)
          Text(text!, style: TextStyle(fontSize: 10, color: Colors.grey[300]!)),
        const SizedBox(height: 5),
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
            child: text != null && value != null
                ? Center(
                    child: Text(
                    value!,
                    style: TextStyle(color: Colors.grey[400]!, fontSize: 12),
                  ))
                : Icon(icon, size: 30, color: Colors.grey[400]!),
          ),
        ),
      ],
    );
  }
}
