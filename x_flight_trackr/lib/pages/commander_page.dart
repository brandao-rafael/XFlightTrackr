import 'package:flutter/material.dart';
import 'package:x_flight_trackr/components/commanders/autopilot/autopilot_commander.dart';
import 'package:x_flight_trackr/components/commanders/system/system_commander.dart';
import 'package:x_flight_trackr/store/autopilot_store.dart';
import 'package:x_flight_trackr/store/flight_plan_store.dart';
import 'package:x_flight_trackr/store/systems_commander_store.dart';

class CommanderPage extends StatelessWidget {
  final FlightPlanStore flightPlanStore;
  CommanderPage({super.key, required this.flightPlanStore});

  final AutopilotStore autopilotStore = AutopilotStore();
  final SystemsCommanderStore systemCommanderStore = SystemsCommanderStore();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AutopilotCommander(
          autopilotStore: autopilotStore,
          flightPlanStore: flightPlanStore,
        ),
        SystemCommander(
          flightPlanStore: flightPlanStore,
          systemsCommanderStore: systemCommanderStore,
        ),
      ],
    );
  }
}
