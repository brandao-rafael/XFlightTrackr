import 'package:flutter/material.dart';
import 'package:x_flight_trackr/components/commanders/autopilot_left_display.dart';
import 'package:x_flight_trackr/components/commanders/autopilot_right_buttons.dart';
import 'package:x_flight_trackr/services/commanders/autopilot/autopilot_service.dart';
import 'package:x_flight_trackr/store/autopilot_store.dart';
import 'package:x_flight_trackr/store/flight_plan_store.dart';

class AutopilotCommander extends StatelessWidget {
  final AutopilotStore autopilotStore;
  final AutopilotService autopilotService;
  final FlightPlanStore flightPlanStore;

  AutopilotCommander(
      {super.key, required this.autopilotStore, required this.flightPlanStore})
      : autopilotService = AutopilotService(autopilotStore);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Colors.grey[900]!,
            Colors.grey[800]!,
            Colors.grey[700]!,
            Colors.grey[800]!,
            Colors.grey[900]!,
          ],
        ),
      ),
      height: 360,
      padding: const EdgeInsets.all(15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          AutopilotLeftDisplay(
            autopilotService: autopilotService,
            autopilotStore: autopilotStore,
            flightPlanStore: flightPlanStore,
          ),
          AutopilotRightButtons(
            autopilotStore: autopilotStore,
            autopilotService: autopilotService,
            flightPlanStore: flightPlanStore,
          ),
        ],
      ),
    );
  }
}
