import 'package:flutter/material.dart';

class FlightPlanResultPage extends StatelessWidget {
  const FlightPlanResultPage({Key? key, required this.results})
      : super(key: key);

  final List<Map<String, dynamic>> results;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flight Plan Results'),
      ),
      body: ListView.builder(
        itemCount: results.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text('Flight Plan ${index + 1}'),
            // Add more details from the results map as needed.
          );
        },
      ),
    );
  }
}
