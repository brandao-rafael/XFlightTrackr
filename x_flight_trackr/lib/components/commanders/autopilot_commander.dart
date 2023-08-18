import 'package:flutter/material.dart';
import 'package:x_flight_trackr/components/commanders/Autopilot_button.dart';
import 'package:x_flight_trackr/components/commanders/autopilot_display.dart';

class AutopilotCommander extends StatelessWidget {
  const AutopilotCommander({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AutopilotButton(isOn: false, text: 'A/T', onPressed: () {}),
        const AutopilotDisplay(value: 30000, text: 'alt'),
      ],
    );
  }
}
