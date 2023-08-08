import 'package:flutter/material.dart';
import 'package:x_flight_trackr/components/black_text.dart';
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
                          BlackText(
                              'From ${selectedFlightPlan['fromName']} to ${selectedFlightPlan['toName']}'),
                          const HorizontalLine(color: Colors.black),
                          BlackText(
                            'Distance: ${selectedFlightPlan['distance'].toStringAsFixed(2)} NM',
                          ),
                          BlackText(
                            "Max Altitude ${selectedFlightPlan['maxAltitude']} foot's",
                          ),
                          BlackText(
                            'Waypoints: ${selectedFlightPlan['waypoints']}',
                          ),
                          const HorizontalLine(color: Colors.black),
                          BlackText(
                            'Notes: ${selectedFlightPlan['notes']}',
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
                                    .map((node) => BlackText(
                                          'Type: ${node['type']}, Ident: ${node['ident']}',
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
