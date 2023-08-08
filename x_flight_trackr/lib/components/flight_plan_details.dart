import 'package:flutter/material.dart';
import 'package:x_flight_trackr/components/black_text.dart';
import 'package:x_flight_trackr/components/flight_plan_database_logo.dart';
import 'package:x_flight_trackr/components/horizontal_line.dart';

class FlightPlanDetails extends StatelessWidget {
  final Map<dynamic, dynamic> selectedFlightPlan;

  const FlightPlanDetails({super.key, required this.selectedFlightPlan});

  @override
  Widget build(BuildContext context) {
    return TextButton.icon(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(Colors.white70),
      ),
      onPressed: () {
        showDialog(
            context: context,
            builder: (ctx) => selectedFlightPlan != {} &&
                    selectedFlightPlan['fromICAO'] != null
                ? AlertDialog(
                    shape: ContinuousRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    titleTextStyle: TextStyle(
                      color: Colors.blueAccent[700]!,
                      fontSize: 20,
                    ),
                    title: const Text('Current Plan Details'),
                    content: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const HorizontalLine(color: Colors.black),
                          const Center(child: FlightPlanDataBaseLogo()),
                          const HorizontalLine(color: Colors.black),
                          const SizedBox(height: 10),
                          BlackText(
                              '${selectedFlightPlan['fromICAO']} to ${selectedFlightPlan['toICAO']}'),
                          BlackText(
                              'From: ${selectedFlightPlan['fromName']}\nTo: ${selectedFlightPlan['toName']}'),
                          const SizedBox(height: 10),
                          const HorizontalLine(color: Colors.black),
                          const SizedBox(height: 10),
                          BlackText(
                            'Distance: ${selectedFlightPlan['distance'].toStringAsFixed(2)} NM',
                          ),
                          BlackText(
                            "Max Altitude ${selectedFlightPlan['maxAltitude']} ft",
                          ),
                          BlackText(
                            'Waypoints: ${selectedFlightPlan['waypoints']}',
                          ),
                          const SizedBox(height: 10),
                          const HorizontalLine(color: Colors.black),
                          const SizedBox(height: 10),
                          BlackText(
                            'Notes: ${selectedFlightPlan['notes']}',
                          ),
                          const HorizontalLine(color: Colors.black),
                          SingleChildScrollView(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const SizedBox(height: 10),
                                const Text(
                                  'Route:',
                                  style: TextStyle(color: Colors.black),
                                ),
                                const SizedBox(height: 5),
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
                    title: Text('Flight Plan Details',
                        style: TextStyle(color: Colors.blueAccent[700]!)),
                    content: const BlackText('No flight plan selected'),
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
