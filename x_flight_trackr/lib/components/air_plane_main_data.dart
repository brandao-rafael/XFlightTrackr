import 'package:flutter/material.dart';
import 'package:x_flight_trackr/components/pitch_roll_display.dart';
import 'package:x_flight_trackr/components/vertical_line.dart';

class AirPlaneMainData extends StatelessWidget {
  final List<double> data;

  const AirPlaneMainData({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              'Airspeed',
            ),
            Text(
              '${data[9].toStringAsFixed(0)} kt',
            ),
            Text(
              '.mach: ${data[18].toStringAsFixed(2)}',
            ),
          ],
        ),
        const VerticalLine(),
        Column(
          children: [
            const Text(
              'Heading',
              textAlign: TextAlign.center,
            ),
            Text('${data[57].toStringAsFixed(0)}°'),
          ],
        ),
        const VerticalLine(),
        Column(
          children: [
            const Text(
              'Altitude',
              textAlign: TextAlign.center,
            ),
            Text('${(data[77]).toStringAsFixed(0)} ft'),
          ],
        ),
        const VerticalLine(),
        PitRollDisplay(pitch: data[54], roll: data[55]),
      ],
    );
  }
}
