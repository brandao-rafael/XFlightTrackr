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
      width: 50,
      child: Stack(
        children: [
          Image.asset(
            _isBrakesOn
                ? 'lib/assets/icons/box_green.png'
                : 'lib/assets/icons/box_red.png',
          ),
          Center(
            child: Text(
              _brakesStatus,
              style: const TextStyle(
                fontSize: 10,
              ),
            ),
          ),
        ],
      ),
    );
  }

  bool get _isBrakesOn => wheelBrakes.toInt() == 1;

  String get _brakesStatus => _isBrakesOn ? 'ON' : 'OFF';
}
