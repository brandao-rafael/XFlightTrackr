import 'package:flutter/material.dart';
import 'package:x_flight_trackr/components/commanders/system/parking_brake_button.dart';

class SystemCommander extends StatelessWidget {
  const SystemCommander({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ParkingBrakeButton(isOn: false),
    );
  }
}
