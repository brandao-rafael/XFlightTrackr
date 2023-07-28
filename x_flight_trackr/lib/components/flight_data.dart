import 'package:flutter/material.dart';
import 'package:x_flight_trackr/components/gear_display.dart';

class FlightData extends StatelessWidget {
  final List<double> data;

  const FlightData({required this.data, super.key});

  String decimalHoursToHoursAndMinutes(double decimalHours) {
    int hours = decimalHours.toInt();
    int minutes = ((decimalHours - hours) * 60).round();

    return '$hours:$minutes';
  }

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 0,
      child: Container(
          color: const Color.fromARGB(125, 0, 0, 0),
          padding: const EdgeInsets.all(8.0),
          height: 200,
          width: MediaQuery.of(context).size.width,
          child: Column(
            children: [
              Text(decimalHoursToHoursAndMinutes(data[6])),
              Row(
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
                  Container(
                    width: 1,
                    height: 50,
                    color: Colors.white,
                    margin: const EdgeInsets.symmetric(horizontal: 8.0),
                  ),
                  Column(
                    children: [
                      const Text(
                        'Heading',
                        textAlign: TextAlign.center,
                      ),
                      Text('${data[57].toStringAsFixed(0)}°'),
                    ],
                  ),
                  Container(
                    width: 1,
                    height: 50,
                    color: Colors.white,
                    margin: const EdgeInsets.symmetric(horizontal: 8.0),
                  ),
                  Column(
                    children: [
                      const Text(
                        'Altitude',
                        textAlign: TextAlign.center,
                      ),
                      Text('${(data[77]).toStringAsFixed(0)} ft'),
                    ],
                  )
                ],
              ),
              Container(
                  color: Colors.white,
                  child: GearDisplay(gearPosition: data[135]))
            ],
          )),
    );
  }
}
