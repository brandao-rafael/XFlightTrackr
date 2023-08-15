import 'package:flutter/material.dart';
import 'package:x_flight_trackr/components/black_text.dart';
import 'package:x_flight_trackr/components/flight_plan_database_logo.dart';
import 'package:x_flight_trackr/components/horizontal_line.dart';

class FlightPlanDetails extends StatelessWidget {
  final Map<dynamic, dynamic> selectedFlightPlan;

  const FlightPlanDetails({Key? key, required this.selectedFlightPlan})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton.icon(
      icon: const Icon(Icons.inventory_outlined),
      label: const Text('Flight Plan Details'),
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(Colors.white70),
      ),
      onPressed: () {
        showDialog(context: context, builder: (ctx) => _buildDialog(ctx));
      },
    );
  }

  Widget _buildDialog(BuildContext context) {
    if (_isValidFlightPlan(selectedFlightPlan)) {
      return _buildFlightPlanDialog(context);
    } else {
      return _buildNoFlightPlanDialog(context);
    }
  }

  bool _isValidFlightPlan(Map<dynamic, dynamic> flightPlan) {
    return flightPlan.isNotEmpty && flightPlan['fromICAO'] != null;
  }

  Widget _buildFlightPlanDialog(BuildContext context) {
    return AlertDialog(
      shape: ContinuousRectangleBorder(
          borderRadius: BorderRadius.circular(20),
          side: BorderSide(color: Colors.blueAccent[700]!)),
      titleTextStyle: TextStyle(
        color: Colors.blueAccent[700]!,
        fontSize: 20,
      ),
      title: const Text('Current Plan Details'),
      content: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: _buildFlightPlanContent(),
          ),
        ),
      ),
      actions: _buildDialogActions(context),
    );
  }

  Widget _buildNoFlightPlanDialog(BuildContext context) {
    return AlertDialog(
      title: Text('Flight Plan Details',
          style: TextStyle(color: Colors.blueAccent[700]!)),
      content: const BlackText('No flight plan selected'),
      actions: _buildDialogActions(context),
    );
  }

  List<Widget> _buildFlightPlanContent() {
    return [
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
      Column(
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
    ];
  }

  List<Widget> _buildDialogActions(BuildContext context) {
    return [
      TextButton(
        onPressed: () {
          Navigator.of(context).pop();
        },
        child: const Text('OK'),
      ),
    ];
  }
}
