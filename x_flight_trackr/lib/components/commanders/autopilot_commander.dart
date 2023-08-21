import 'package:flutter/material.dart';
import 'package:x_flight_trackr/components/commanders/Autopilot_button.dart';
import 'package:x_flight_trackr/components/commanders/autopilot_display.dart';
import 'package:x_flight_trackr/components/commanders/radial_button.dart';

class AutopilotCommander extends StatelessWidget {
  const AutopilotCommander({super.key});

  bool exists(int index, List<double> list) {
    try {
      // ignore: unnecessary_null_comparison
      if (list[index] != null) {
        return true;
      } else {
        return false;
      }
    } on RangeError {
      return false;
    } catch (_) {
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Colors.grey[900]!,
            Colors.grey[800]!,
            Colors.grey[700]!,
            Colors.grey[800]!,
            Colors.grey[900]!,
          ],
        ),
      ),
      height: 360,
      padding: const EdgeInsets.all(15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              AutopilotDisplay(value: 290, text: 'spd'),
              AutopilotDisplay(value: 300, text: 'hdg'),
              AutopilotDisplay(value: 30000, text: 'alt'),
              AutopilotDisplay(value: -2000, text: 'vs'),
              AutopilotDisplay(value: 320, text: 'crs'),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Row(
                children: [
                  AutopilotButton(isOn: false, text: 'A/T', onPressed: () {}),
                  const SizedBox(width: 15),
                  AutopilotButton(isOn: false, text: 'SPEED', onPressed: () {}),
                  const SizedBox(width: 15),
                  AutopilotButton(isOn: false, text: 'N1', onPressed: () {}),
                ],
              ),
              const SizedBox(height: 5),
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  AutopilotButton(
                    isOn: true,
                    text: 'HDG',
                    onPressed: () {},
                  ),
                  const SizedBox(width: 10),
                  const RadialButton(
                    icon: Icons.text_rotation_angleup_outlined,
                    text: 'Bank A.',
                    radius: 25,
                  ),
                  const SizedBox(width: 10),
                  AutopilotButton(isOn: false, text: 'LNAV', onPressed: () {}),
                ],
              ),
              const SizedBox(height: 20),
              Row(
                children: [
                  AutopilotButton(
                    isOn: true,
                    text: 'ALT',
                    onPressed: () {},
                  ),
                  const SizedBox(width: 10),
                  AutopilotButton(isOn: false, text: 'VNAV', onPressed: () {}),
                  const SizedBox(width: 10),
                  AutopilotButton(isOn: true, text: 'V/S', onPressed: () {}),
                ],
              ),
              const SizedBox(height: 20),
              Row(
                children: [
                  AutopilotButton(isOn: false, text: 'AP', onPressed: () {}),
                  const SizedBox(width: 10),
                  AutopilotButton(
                    isOn: false,
                    text: 'APP',
                    onPressed: () {},
                  ),
                  const SizedBox(width: 10),
                  AutopilotButton(isOn: false, text: 'F/D', onPressed: () {}),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
