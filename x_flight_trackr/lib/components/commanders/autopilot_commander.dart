import 'package:flutter/material.dart';
import 'package:x_flight_trackr/components/commanders/Autopilot_button.dart';
import 'package:x_flight_trackr/components/commanders/autopilot_display.dart';

class AutopilotCommander extends StatelessWidget {
  const AutopilotCommander({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey[600],
      height: 300,
      padding: const EdgeInsets.all(15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AutopilotDisplay(value: 30000, text: 'alt'),
              AutopilotDisplay(value: 290, text: 'spd'),
              AutopilotDisplay(value: 300, text: 'hdg'),
              AutopilotDisplay(value: 320, text: 'crs'),
              AutopilotDisplay(value: -2000, text: 'vs'),
            ],
          ),
          Column(
            children: [
              Row(
                children: [
                  AutopilotButton(isOn: false, text: 'AP', onPressed: () {}),
                  const SizedBox(width: 15),
                  AutopilotButton(isOn: false, text: 'APP', onPressed: () {}),
                ],
              ),
              const SizedBox(height: 20),
              Row(
                children: [
                  AutopilotButton(isOn: false, text: 'F/D', onPressed: () {}),
                  const SizedBox(width: 15),
                  AutopilotButton(isOn: true, text: 'A/T', onPressed: () {}),
                ],
              ),
              const SizedBox(height: 20),
              Row(
                children: [
                  AutopilotButton(isOn: false, text: 'VNAV', onPressed: () {}),
                  const SizedBox(width: 15),
                  AutopilotButton(isOn: false, text: 'ALT', onPressed: () {}),
                ],
              ),
              const SizedBox(height: 20),
              Row(
                children: [
                  AutopilotButton(isOn: true, text: 'SPEED', onPressed: () {}),
                  const SizedBox(width: 15),
                  AutopilotButton(isOn: true, text: 'V/S', onPressed: () {}),
                ],
              ),
              const SizedBox(height: 20),
              Row(
                children: [
                  AutopilotButton(isOn: false, text: 'LNAV', onPressed: () {}),
                  const SizedBox(width: 15),
                  AutopilotButton(isOn: false, text: 'HDG', onPressed: () {}),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
