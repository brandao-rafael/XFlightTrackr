import 'package:flutter/material.dart';
import 'package:x_flight_trackr/components/black_text.dart';
import 'package:x_flight_trackr/components/horizontal_line.dart';
import 'package:x_flight_trackr/store/flight_plan_store.dart';

class FlightPlanResultPage extends StatelessWidget {
  final FlightPlanStore flightPlanStore;

  FlightPlanResultPage({Key? key, required this.flightPlanStore})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<dynamic> flightPlans = flightPlanStore.flightPlans;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Flight Plan Results'),
        backgroundColor: Colors.blueAccent[700],
      ),
      backgroundColor: Colors.blue.shade50,
      body: ListView.builder(
        itemCount: flightPlans.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Column(
              children: [
                const HorizontalLine(color: Colors.black),
                Text(
                  '${flightPlans[index]['fromICAO']} to ${flightPlans[index]['toICAO']}',
                  style: TextStyle(color: Colors.blueAccent[700]!),
                ),
              ],
            ),
            key: index == 0 ? const Key('first') : Key(index.toString()),
            subtitle: SizedBox(
              // height: 500,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const HorizontalLine(color: Colors.black),
                        const SizedBox(height: 20),
                        BlackText(
                          'From: ${flightPlans[index]['fromName']}\nTo: ${flightPlans[index]['toName']}',
                        ),
                        BlackText(
                          'Distance: ${flightPlans[index]['distance'].toStringAsFixed(2)} NM',
                        ),
                        BlackText(
                          "Max Altitude ${flightPlans[index]['maxAltitude']} foot's",
                        ),
                        BlackText(
                          'Waypoints: ${flightPlans[index]['waypoints']}',
                        ),
                        BlackText(
                          'Notes: ${flightPlans[index]['notes']}',
                        ),
                        const SizedBox(height: 10),
                      ],
                    ),
                    ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(
                          Colors.blueAccent[700]!,
                        ),
                      ),
                      onPressed: () {
                        flightPlanStore
                            .setSelectedFlightPlan(flightPlans[index]);
                        Navigator.pop(context);
                      },
                      child: const Text(
                        'Select this flight plan',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
