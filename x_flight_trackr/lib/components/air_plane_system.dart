import 'package:flutter/material.dart';
import 'package:x_flight_trackr/components/bar_display.dart';
import 'package:x_flight_trackr/components/gear_display.dart';
import 'package:x_flight_trackr/components/wheel_brakes_display.dart';

class AirPlaneSystem extends StatelessWidget {
  final List<double> data;

  const AirPlaneSystem({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black12,
      padding: const EdgeInsets.all(10),
      width: double.infinity,
      margin: const EdgeInsets.only(
        top: 10,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          GearDisplay(gearPosition: data[135]),
          WheelBrakesDisplay(wheelBrakes: data[46]),
          BarDisplay(
            title: 'Flaps',
            handsPosition: data[39],
            realPosition: data[40],
          ),
          BarDisplay(
            title: 'Speedbrakes',
            handsPosition: data[42],
            realPosition: data[43],
          ),
          BarDisplay(
            title: 'Throttle',
            handsPosition: data[117],
            realPosition: data[126],
          ),
        ],
      ),
    );
  }
}
