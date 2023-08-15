import 'package:flutter/material.dart';

class FlightPlanSubmitButton extends StatelessWidget {
  const FlightPlanSubmitButton({Key? key, required this.onSubmit})
      : super(key: key);

  final VoidCallback? onSubmit;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(
          Colors.blueAccent[700]!,
        ),
      ),
      onPressed: onSubmit,
      child: const Text(
        'Search',
        style: TextStyle(
          fontSize: 20,
          color: Colors.white,
        ),
      ),
    );
  }
}
