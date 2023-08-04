import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:provider/provider.dart';
import 'package:x_flight_trackr/pages/home_page.dart';
import 'package:x_flight_trackr/providers/flight_plan_provider.dart';

void main() async {
  runApp(const MyApp());
  await dotenv.load(fileName: ".env");
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  static const String _title = 'X Flight Trackr';

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => FlightPlanProvider(),
      child: const MaterialApp(
        title: _title,
        home: HomePage(),
      ),
    );
  }
}
