import 'package:flutter/material.dart';

class WheelBrakesDisplay extends StatelessWidget {
  final double wheelBrakes;
  const WheelBrakesDisplay({super.key, required this.wheelBrakes});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text('Brakes'),
        Container(
          alignment: AlignmentDirectional.center,
          height: 50,
          margin: const EdgeInsets.all(2),
          width: 20,
          decoration: BoxDecoration(
            color: wheelBrakes.toInt() == 1 ? Colors.red : Colors.green,
          ),
          child: Text(
            wheelBrakes.toInt() == 1 ? 'ON' : 'OFF',
            style: const TextStyle(
              fontSize: 10,
            ),
          ),
        ),
      ],
    );
  }
}
