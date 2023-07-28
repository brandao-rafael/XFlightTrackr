import 'package:flutter/material.dart';

class LocalTime extends StatelessWidget {
  final double decimalHours;

  const LocalTime({required this.decimalHours, super.key});

  String decimalHoursToHoursAndMinutes(double decimalHours) {
    int hours = decimalHours.toInt();
    int minutes = ((decimalHours - hours) * 60).round();

    return '$hours:$minutes';
  }

  @override
  Widget build(BuildContext context) {
    return Text(decimalHoursToHoursAndMinutes(decimalHours));
  }
}
