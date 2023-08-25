import 'package:flutter/material.dart';
import 'package:x_flight_trackr/components/commanders/system/parking_brake_button.dart';
import 'package:x_flight_trackr/components/commanders/system/rotary_switcher.dart';

class SystemCommander extends StatelessWidget {
  const SystemCommander({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const ParkingBrakeButton(isOn: false),
        RotarySwitcher(
          onChanged: (value) {
            print(value - 1);
          },
        ),
      ],
    );
  }
}
