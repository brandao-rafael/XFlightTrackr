import 'package:flutter/material.dart';
import 'package:x_flight_trackr/components/bar_display.dart';
import 'package:x_flight_trackr/components/gear_display.dart';
import 'package:x_flight_trackr/components/wheel_brakes_display.dart';

class AirPlaneSystem extends StatelessWidget {
  final List<double> data;

  const AirPlaneSystem({
    Key? key,
    required this.data,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black12,
      padding: const EdgeInsets.all(10),
      width: double.infinity,
      margin: const EdgeInsets.only(top: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          GearDisplay(gearPosition: data[585]),
          WheelBrakesDisplay(wheelBrakes: data[118]),
          _buildBarDisplay('Flaps', data[111], data[112]),
          _buildBarDisplay('Speedbrakes', data[114], data[115]),
          _buildBarDisplay('Throttle', data[216], data[225]),
        ],
      ),
    );
  }

  BarDisplay _buildBarDisplay(
      String title, double handsPosition, double realPosition) {
    return BarDisplay(
      title: title,
      handsPosition: handsPosition,
      realPosition: realPosition,
    );
  }
}
