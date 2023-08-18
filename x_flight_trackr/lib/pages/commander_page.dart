import 'package:flutter/material.dart';
import 'package:x_flight_trackr/components/commanders/autopilot_commander.dart';

class CommanderPage extends StatelessWidget {
  const CommanderPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Commander'),
      ),
      body: const AutopilotCommander(),
    );
  }
}
