import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:x_flight_trackr/components/commanders/autopilot_commander.dart';

class CommanderPage extends StatelessWidget {
  const CommanderPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        centerTitle: true,
        title: Text(
          'Commander',
          style: TextStyle(
            fontSize: 20,
            fontFamily:
                GoogleFonts.montserrat(fontWeight: FontWeight.w200).fontFamily,
          ),
        ),
      ),
      body: const AutopilotCommander(),
    );
  }
}
