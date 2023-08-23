import 'package:flutter/material.dart';
import 'package:x_flight_trackr/components/commanders/autopilot_commander.dart';
import 'package:x_flight_trackr/store/autopilot_store.dart';
import 'package:x_flight_trackr/store/flight_plan_store.dart';

class CommanderPage extends StatelessWidget {
  final FlightPlanStore flightPlanStore;

  CommanderPage({super.key, required this.flightPlanStore});

  final AutopilotStore autopilotStore = AutopilotStore();

  @override
  Widget build(BuildContext context) {
    return AutopilotCommander(
      autopilotStore: autopilotStore,
      flightPlanStore: flightPlanStore,
    );
  }
}
