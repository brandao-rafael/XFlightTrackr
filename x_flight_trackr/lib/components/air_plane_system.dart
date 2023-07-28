import 'package:flutter/material.dart';
import 'package:x_flight_trackr/components/gear_display.dart';

class AirPlaneSystem extends StatelessWidget {
  final List<double> data;

  const AirPlaneSystem({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        GearDisplay(gearPosition: data[135]),
      ],
    );
  }
}
