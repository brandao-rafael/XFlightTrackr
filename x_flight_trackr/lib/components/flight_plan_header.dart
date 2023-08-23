import 'package:flutter/material.dart';
import 'package:x_flight_trackr/components/flight_plan_database_logo.dart';

class FlightPlanHeader extends StatelessWidget {
  const FlightPlanHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          'Search Flight Plan',
          style: TextStyle(
            fontSize: 22,
            color: Colors.blueAccent[700]!,
            fontWeight: FontWeight.w300,
          ),
        ),
        const FlightPlanDataBaseLogo(),
      ],
    );
  }
}
