import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:x_flight_trackr/pages/home_page.dart';

void main() async {
  runApp(const HomePage());
  await dotenv.load(fileName: ".env");
}
