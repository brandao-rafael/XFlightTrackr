import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:x_flight_trackr/providers/flight_plan_provider.dart';

class FlightPlanResultPage extends StatelessWidget {
  const FlightPlanResultPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final flightPlanProvider =
        Provider.of<FlightPlanProvider>(context, listen: true);

    List<dynamic> flightPlans = flightPlanProvider.flightPlans;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Flight Plan Results'),
        backgroundColor: Colors.blueAccent[700],
      ),
      body: ListView.builder(
        itemCount: flightPlans.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(
              '${flightPlans[index]['fromICAO']} to ${flightPlans[index]['toICAO']}',
              style: const TextStyle(color: Colors.black),
            ),
            key: index == 0 ? const Key('first') : Key(index.toString()),
            subtitle: SizedBox(
              height: 500,
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'from ${flightPlans[index]['fromName']} to ${flightPlans[index]['toName']}',
                      style: TextStyle(color: Colors.grey[600]),
                    ),
                    Text(
                      'Distance: ${flightPlans[index]['distance'].toStringAsFixed(2)} NM',
                      style: const TextStyle(color: Colors.black),
                    ),
                    Text(
                      "Max Altitude ${flightPlans[index]['maxAltitude']} foot's",
                      style: TextStyle(color: Colors.grey[600]),
                    ),
                    Text('Waypoints: ${flightPlans[index]['waypoints']}',
                        style: TextStyle(color: Colors.grey[600])),
                    Text('Notes: ${flightPlans[index]['notes']}',
                        style: TextStyle(color: Colors.grey[600])),
                    TextButton(
                      onPressed: () {
                        flightPlanProvider
                            .setSelectedFlightPlan(flightPlans[index]);
                        Navigator.pop(context);
                      },
                      child: Text(
                        'Select this flight plan',
                        style: TextStyle(
                          color: Colors.white,
                          backgroundColor: Colors.blueAccent[700],
                          height: 2,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),

            // Add more details from the results map as needed.
          );
        },
      ),
    );
  }
}
