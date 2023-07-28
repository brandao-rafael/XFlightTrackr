import 'package:flutter/material.dart';
import 'package:x_flight_trackr/components/flaps_display.dart';
import 'package:x_flight_trackr/components/gear_display.dart';

class AirPlaneSystem extends StatelessWidget {
  final List<double> data;

  const AirPlaneSystem({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        GearDisplay(gearPosition: data[135]),
        FlapsDisplay(handflapsPosition: data[39], flapsPosition: data[40]),
      ],
    );
  }
}
