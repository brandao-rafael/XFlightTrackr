import 'package:flutter/material.dart';

class WheelBrakesDisplay extends StatelessWidget {
  final double wheelBrakes;

  const WheelBrakesDisplay({
    Key? key,
    required this.wheelBrakes,
  }) : super(key: key);

  Color get _color => _isBrakesOn ? Colors.green : Colors.red;

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
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(
          color: _color,
          spreadRadius: 1,
          blurRadius: 6,
          offset: const Offset(0, 1),
        ),
      ]),
      height: 50,
      margin: const EdgeInsets.all(2),
      width: 50,
      child: Stack(
        children: [
          AnimatedSwitcher(
            duration: const Duration(milliseconds: 500),
            child: Image.asset(
              _isBrakesOn
                  ? 'lib/assets/icons/box_green.png'
                  : 'lib/assets/icons/box_red.png',
              key: ValueKey<bool>(_isBrakesOn), // ensures animation on change
            ),
          ),
          Center(
            child: AnimatedOpacity(
              opacity: 1.0, // 1 for visible, 0 for invisible
              duration: const Duration(milliseconds: 500),
              child: Text(
                _brakesStatus,
                style: const TextStyle(
                  fontSize: 10,
                ),
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
