import 'package:flutter/material.dart';

class FlightPlanTextField extends StatelessWidget {
  const FlightPlanTextField({
    Key? key,
    required this.onChanged,
    required this.labelText,
    required this.hintText,
  }) : super(key: key);

  final void Function(String) onChanged;
  final String labelText;
  final String hintText;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: onChanged,
      style: const TextStyle(color: Colors.black),
      decoration: InputDecoration(
        labelText: labelText,
        hintText: hintText,
      ),
      validator: (value) {
        if (value == null || value.isEmpty || value.length < 4) {
          return 'Please enter a valid value';
        }
        return null;
      },
    );
  }
}
