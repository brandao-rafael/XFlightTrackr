import 'package:flutter/material.dart';
import 'package:x_flight_trackr/components/commanders/system/parking_brake_light.dart';
import 'package:x_flight_trackr/components/commanders/system/switcher.dart';

class ParkingBrakeSwitcher extends StatelessWidget {
  const ParkingBrakeSwitcher({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: SizedBox(
        height: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const ParkingBrakeLight(isOn: true),
            const SizedBox(height: 10),
            Text("Parking\n  Brake",
                style: TextStyle(fontSize: 10, color: Colors.grey[100])),
            const SizedBox(height: 10),
            Switcher(
              onChanged: (value) => print(value),
              up: "OFF",
              down: "ON",
              height: 120,
              width: 40,
            ),
          ],
        ),
      ),
    );
  }
}
