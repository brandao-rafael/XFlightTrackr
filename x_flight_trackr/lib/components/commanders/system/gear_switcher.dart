import 'package:flutter/material.dart';
import 'package:x_flight_trackr/components/commanders/system/painters/gear_painter.dart';
import 'package:x_flight_trackr/components/gear_display.dart';

class GearSwitcher extends StatefulWidget {
  final ValueChanged<int> onChanged;

  const GearSwitcher({Key? key, required this.onChanged}) : super(key: key);

  @override
  _GearSwitcherState createState() => _GearSwitcherState();
}

class _GearSwitcherState extends State<GearSwitcher> {
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
          const GearDisplay(gearPosition: 0),
          const Text('Gear',
              style: TextStyle(
                fontSize: 10,
                color: Colors.grey,
              )),
          const SizedBox(height: 10),
          CustomPaint(
            size: const Size(50, 150),
            painter: GearPainter(_currentValue),
          ),
        ],
      ),
    );
  }
}
