import 'package:flutter/material.dart';
import 'package:x_flight_trackr/components/commanders/autopilot_commander.dart';
import 'package:x_flight_trackr/store/autopilot_store.dart';

class CommanderPage extends StatelessWidget {
  CommanderPage({super.key});

  final AutopilotStore autopilotStore = AutopilotStore();

  @override
  Widget build(BuildContext context) {
    return AutopilotCommander(
      autopilotStore: autopilotStore,
    );
  }
}
