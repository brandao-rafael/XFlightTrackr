import 'package:flutter/material.dart';
import 'package:x_flight_trackr/components/air_plane_main_data.dart';
import 'package:x_flight_trackr/components/air_plane_system.dart';
import 'package:x_flight_trackr/components/horizontal_line.dart';
import 'package:x_flight_trackr/components/local_time.dart';

class FlightData extends StatelessWidget {
  final List<double> data;

  const FlightData({required this.data, super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 0,
      child: Container(
          color: const Color.fromARGB(125, 0, 0, 0),
          padding: const EdgeInsets.all(8.0),
          height: 220,
          width: MediaQuery.of(context).size.width,
          child: Column(
            children: [
              LocalTime(decimalHours: data[6]),
              const HorizontalLine(),
              AirPlaneMainData(data: data),
              const HorizontalLine(),
              AirPlaneSystem(data: data),
            ],
          )),
    );
  }
}
