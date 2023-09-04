import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:x_flight_trackr/components/commanders/autopilot/autopilot_display.dart';
import 'package:x_flight_trackr/services/commanders/autopilot/autopilot_service.dart';
import 'package:x_flight_trackr/services/commanders/autopilot/autopilot_status_service.dart';
import 'package:x_flight_trackr/store/autopilot_store.dart';
import 'package:x_flight_trackr/store/flight_plan_store.dart';

class AutopilotLeftDisplay extends StatelessWidget {
  final AutopilotService autopilotService;
  final AutopilotStore autopilotStore;
  final FlightPlanStore flightPlanStore;

  final AutopilotStatusService autopilotStatus;

  AutopilotLeftDisplay({
    super.key,
    required this.autopilotService,
    required this.autopilotStore,
    required this.flightPlanStore,
  }) : autopilotStatus = AutopilotStatusService(
          flightPlanStore: flightPlanStore,
          autopilotStore: autopilotStore,
        );

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (context) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          AutopilotDisplay(
            value: autopilotStatus.getAltitudeValue(),
            text: 'spd',
            onPanUpdate: (d) => autopilotService.panHandler(
                d, 30, autopilotService.setAirspeed),
          ),
          AutopilotDisplay(
            value: autopilotStatus.getHeading(),
            text: 'hdg',
            onPanUpdate: (d) =>
                autopilotService.panHandler(d, 30, autopilotService.setHeading),
          ),
          AutopilotDisplay(
            value: autopilotStatus.getAltitude(),
            text: 'alt',
            onPanUpdate: (d) => autopilotService.panHandler(
                d, 30, autopilotService.setAltitude),
          ),
          AutopilotDisplay(
            value: autopilotStatus.getVerticalSpeed(),
            text: 'vs',
            onPanUpdate: (d) => autopilotService.panHandler(
                d, 30, autopilotService.setVerticalSpeed),
          ),
          AutopilotDisplay(
            value: autopilotStore.course.toInt(),
            text: 'crs',
            onPanUpdate: (d) =>
                autopilotService.panHandler(d, 30, autopilotService.setCourse),
          ),
        ],
      );
    });
  }
}
