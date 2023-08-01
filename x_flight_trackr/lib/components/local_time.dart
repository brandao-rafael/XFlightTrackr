import 'package:flutter/material.dart';

class LocalTime extends StatelessWidget {
  final double decimalHours;

  const LocalTime({
    Key? key,
    required this.decimalHours,
  }) : super(key: key);

  String get _hoursAndMinutes {
    int hours = decimalHours.toInt();
    int minutes = ((decimalHours - hours) * 60).round();

    return '${hours.toString().padLeft(2, '0')}:${minutes.toString().padLeft(2, '0')}';
  }

  @override
  Widget build(BuildContext context) {
    return Text(_hoursAndMinutes);
  }
}
