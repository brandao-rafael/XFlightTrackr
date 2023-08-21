import 'package:flutter/material.dart';

class RadialButton extends StatelessWidget {
  final String? text;
  final IconData icon;

  const RadialButton({required this.icon, this.text, super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (text != null)
          Text(text!, style: TextStyle(fontSize: 10, color: Colors.grey[200]!)),
        const SizedBox(height: 5),
        Container(
          height: 35,
          width: 35,
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
          child: IconButton(
            color: Colors.grey,
            onPressed: () {},
            icon: Icon(icon, size: 15),
          ),
        ),
      ],
    );
  }
}
