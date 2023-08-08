import 'package:flutter/material.dart';

class FlightPlanDetails extends StatelessWidget {
  final selectedFlightPlan;

  const FlightPlanDetails({super.key, required this.selectedFlightPlan});

  @override
  Widget build(BuildContext context) {
    return TextButton.icon(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(Colors.white54),
      ),
      onPressed: () {
        showDialog(
            context: context,
            builder: (ctx) => selectedFlightPlan != null
                ? AlertDialog(
                    title: const Text('Flight Plan Details'),
                    content: const Text('This feature is not yet implemented'),
                    actions: [
                      TextButton(
                        onPressed: () {
                          Navigator.of(ctx).pop();
                        },
                        child: const Text('OK'),
                      ),
                    ],
                  )
                : AlertDialog(
                    title: const Text('Flight Plan Details'),
                    content: const Text('No flight plan selected'),
                    actions: [
                      TextButton(
                        onPressed: () {
                          Navigator.of(ctx).pop();
                        },
                        child: const Text('OK'),
                      ),
                    ],
                  ));
      },
      icon: const Icon(Icons.format_align_center_sharp),
      label: const Text('Flight Plan Details'),
    );
  }
}
