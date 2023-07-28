import 'package:flutter/material.dart';

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
    );
  }
}
