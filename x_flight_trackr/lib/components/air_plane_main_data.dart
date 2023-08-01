import 'package:flutter/material.dart';
import 'package:x_flight_trackr/components/pitch_roll_display.dart';
import 'package:x_flight_trackr/components/vertical_line.dart';

class AirPlaneMainData extends StatelessWidget {
  final List<double> data;

  const AirPlaneMainData({
    Key? key,
    required this.data,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        _buildAirspeedColumn(),
        const VerticalLine(),
        _buildHeadingColumn(),
        const VerticalLine(),
        _buildAltitudeColumn(),
        const VerticalLine(),
        PitRollDisplay(pitch: data[144], roll: data[145]),
      ],
    );
  }

  Column _buildAirspeedColumn() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Text('Airspeed'),
        Text('${data[27].toStringAsFixed(0)} kt'),
        Text('.mach: ${data[36].toStringAsFixed(3)}'),
      ],
    );
  }

  Column _buildHeadingColumn() {
    return Column(
      children: [
        const Text('Heading', textAlign: TextAlign.center),
        Text('${data[147].toStringAsFixed(0)}°'),
      ],
    );
  }

  Column _buildAltitudeColumn() {
    return Column(
      children: [
        const Text('Altitude', textAlign: TextAlign.center),
        Text('${(data[176]).toStringAsFixed(0)} ft'),
      ],
    );
  }
}
