import 'package:flutter/material.dart';
import 'package:x_flight_trackr/components/commanders/system/flap_slider.dart';
import 'package:x_flight_trackr/components/commanders/system/gear_switcher.dart';
import 'package:x_flight_trackr/components/commanders/system/parking_brake_switcher.dart';
import 'package:x_flight_trackr/components/commanders/system/auto_brake_rotary_switcher.dart';
import 'package:x_flight_trackr/components/commanders/system/speed_brake_slider.dart';
import 'package:x_flight_trackr/components/commanders/system/throttle_slider.dart';

class SystemCommander extends StatelessWidget {
  const SystemCommander({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250,
      decoration: BoxDecoration(
        color: Colors.black.withOpacity(0.65),
      ),
      padding: const EdgeInsets.only(top: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const ParkingBrakeSwitcher(),
          AutoBrakeRotarySwitcher(
            onChanged: (value) {
              print(value - 1);
            },
          ),
          SpeedBrakeSlider(
            onChanged: (value) {
              print("Speed Brake Value: $value");
            },
          ),
          ThrottleSlider(onChanged: (value) => print("Throttle Value: $value")),
          FlapSlider(onChanged: (value) => print("Flap Value: $value")),
          const GearSwitcher(),
        ],
      ),
    );
  }
}
