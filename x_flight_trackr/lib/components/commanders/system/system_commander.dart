import 'package:flutter/material.dart';
import 'package:x_flight_trackr/components/commanders/system/flap_slider.dart';
import 'package:x_flight_trackr/components/commanders/system/parking_brake_button.dart';
import 'package:x_flight_trackr/components/commanders/system/rotary_switcher.dart';
import 'package:x_flight_trackr/components/commanders/system/speed_brake_slider.dart';

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
        SpeedBrakeSlider(
          onChanged: (value) {
            print("Speed Brake Value: $value");
          },
        ),
        FlapSlider(onChanged: (value) => print("Flap Value: $value")),
      ],
    );
  }
}
