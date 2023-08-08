import 'package:flutter/material.dart';
import 'package:x_flight_trackr/components/horizontal_line.dart';

class FlightPlanDetails extends StatelessWidget {
  final Map<dynamic, dynamic> selectedFlightPlan;

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
            builder: (ctx) => selectedFlightPlan != {}
                ? AlertDialog(
                    title: const Text('Flight Plan Details'),
                    content: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const HorizontalLine(color: Colors.black),
                          Text(
                            'From ${selectedFlightPlan['fromName']} to ${selectedFlightPlan['toName']}',
                            style: const TextStyle(color: Colors.black),
                          ),
                          const HorizontalLine(color: Colors.black),
                          Text(
                            'Distance: ${selectedFlightPlan['distance'].toStringAsFixed(2)} NM',
                            style: const TextStyle(color: Colors.black),
                          ),
                          Text(
                            "Max Altitude ${selectedFlightPlan['maxAltitude']} foot's",
                            style: const TextStyle(color: Colors.black),
                          ),
                          Text(
                            'Waypoints: ${selectedFlightPlan['waypoints']}',
                            style: const TextStyle(color: Colors.black),
                          ),
                          const HorizontalLine(color: Colors.black),
                          Text(
                            'Notes: ${selectedFlightPlan['notes']}',
                            style: const TextStyle(color: Colors.black),
                          ),
                          const HorizontalLine(color: Colors.black),
                          SingleChildScrollView(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  'Route:',
                                  style: TextStyle(color: Colors.black),
                                ),
                                ...selectedFlightPlan['route']['nodes']
                                    .map((node) => Text(
                                          'Type: ${node['type']}, Ident: ${node['ident']}',
                                          style: const TextStyle(
                                            color: Colors.black,
                                          ),
                                        ))
                                    .toList(),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
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
