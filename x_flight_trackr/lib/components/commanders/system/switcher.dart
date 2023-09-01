import 'package:flutter/material.dart';
import 'package:x_flight_trackr/components/commanders/system/painters/switch_painter.dart';

class Switcher extends StatefulWidget {
  final ValueChanged<int> onChanged;
  final String? name;
  final String? up;
  final String? down;
  final double? height;
  final double? width;

  const Switcher({
    Key? key,
    required this.onChanged,
    this.name,
    this.up = 'UP',
    this.down = 'DOWN',
    this.height = 150,
    this.width = 50,
  }) : super(key: key);

  @override
  _SwitcherState createState() => _SwitcherState();
}

class _SwitcherState extends State<Switcher> {
  int _currentValue = 0; // Off position

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _currentValue = _currentValue == 0 ? 1 : 0;
          widget.onChanged(_currentValue);
        });
      },
      child: Column(
        children: [
          if (widget.name != null)
            Text(widget.name!,
                style: const TextStyle(
                  fontSize: 10,
                  color: Colors.grey,
                )),
          const SizedBox(height: 10),
          CustomPaint(
            size: Size(widget.width!, widget.height!),
            painter: SwitcherPainter(_currentValue,
                up: widget.up!, down: widget.down!),
          ),
        ],
      ),
    );
  }
}
