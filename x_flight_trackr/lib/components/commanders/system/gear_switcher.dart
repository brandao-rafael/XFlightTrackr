import 'package:flutter/material.dart';
import 'package:x_flight_trackr/components/commanders/system/switcher.dart';
import 'package:x_flight_trackr/components/gear_display.dart';

class GearSwitcher extends StatelessWidget {
  final Function(int) onChange;
  const GearSwitcher({super.key, required this.onChange});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GearDisplay(gearPosition: 0),
        Text("Gear", style: TextStyle(fontSize: 10, color: Colors.grey[100])),
        const SizedBox(height: 10),
        Switcher(
          onChanged: onChange,
          height: 130,
          width: 40,
        ),
      ],
    );
  }
}
