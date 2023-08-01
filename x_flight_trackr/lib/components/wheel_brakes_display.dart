import 'package:flutter/material.dart';

class WheelBrakesDisplay extends StatelessWidget {
  final double wheelBrakes;

  const WheelBrakesDisplay({
    Key? key,
    required this.wheelBrakes,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text('Brakes'),
        _buildBrakesIndicator(),
      ],
    );
  }

  Container _buildBrakesIndicator() {
    return Container(
      alignment: AlignmentDirectional.center,
      height: 50,
      margin: const EdgeInsets.all(2),
      width: 20,
      decoration: BoxDecoration(
        color: _isBrakesOn ? Colors.green : Colors.red,
      ),
      child: Text(
        _brakesStatus,
        style: const TextStyle(
          fontSize: 10,
        ),
      ),
    );
  }

  bool get _isBrakesOn => wheelBrakes.toInt() == 1;

  String get _brakesStatus => _isBrakesOn ? 'ON' : 'OFF';
}
