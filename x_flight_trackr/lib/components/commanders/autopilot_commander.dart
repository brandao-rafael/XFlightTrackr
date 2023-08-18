import 'package:flutter/material.dart';
import 'package:x_flight_trackr/components/commanders/Autopilot_button.dart';

class AutopilotCommander extends StatelessWidget {
  const AutopilotCommander({super.key});

  @override
  Widget build(BuildContext context) {
    return AutopilotButton(isOn: false, text: 'A/T', onPressed: () {});
  }
}
