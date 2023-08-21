import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:provider/provider.dart';
import 'package:x_flight_trackr/pages/commander_page.dart';
import 'package:x_flight_trackr/store/autopilot_store.dart';
import 'package:x_flight_trackr/store/efis_commander_store.dart';
import 'package:x_flight_trackr/store/flight_plan_store.dart';
import 'package:x_flight_trackr/store/form_store.dart';
import 'package:x_flight_trackr/store/systems_commander_store.dart';

void main() async {
  runApp(const MyApp());
  await dotenv.load(fileName: ".env");
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  static const String _title = 'X Flight Trackr';

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider(create: (_) => FormStore()),
        Provider(create: (_) => FlightPlanStore()),
        Provider(create: (_) => AutopilotStore()),
        Provider(create: (_) => EFISCommanderStore()),
        Provider(create: (_) => SystemsCommanderStore()),
      ],
      child: const MaterialApp(
        title: _title,
        home: CommanderPage(),
      ),
    );
  }
}
