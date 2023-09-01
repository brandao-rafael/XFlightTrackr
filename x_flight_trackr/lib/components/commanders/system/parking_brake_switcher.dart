import 'package:flutter/material.dart';
import 'package:x_flight_trackr/components/commanders/system/parking_brake_light.dart';
import 'package:x_flight_trackr/components/commanders/system/switcher.dart';

class ParkingBrakeSwitcher extends StatelessWidget {
  const ParkingBrakeSwitcher({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const ParkingBrakeLight(isOn: true),
        const SizedBox(height: 10),
        const Text("Parking Brake",
            style: TextStyle(fontSize: 8, color: Colors.grey)),
        const SizedBox(height: 10),
        Switcher(
          onChanged: (value) => print(value),
          up: "OFF",
          down: "ON",
          height: 100,
          width: 40,
        ),
      ],
    );
  }
}
