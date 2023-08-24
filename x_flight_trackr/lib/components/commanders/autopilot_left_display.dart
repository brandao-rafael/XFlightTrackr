import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:x_flight_trackr/components/commanders/autopilot_display.dart';
import 'package:x_flight_trackr/services/commanders/autopilot/autopilot_service.dart';
import 'package:x_flight_trackr/store/autopilot_store.dart';
import 'package:x_flight_trackr/store/flight_plan_store.dart';

class AutoPilotLeftDisplay extends StatelessWidget {
  final AutopilotService autopilotService;
  final AutopilotStore autopilotStore;
  final FlightPlanStore flightPlanStore;

  const AutoPilotLeftDisplay(
      {super.key,
      required this.autopilotService,
      required this.autopilotStore,
      required this.flightPlanStore});

  int _getAltitudeValue() {
    if (flightPlanStore.xPlaneData.isNotEmpty) {
      return flightPlanStore.xPlaneData[1035].toInt();
    } else {
      return autopilotStore.airspeed.toInt();
    }
  }

  int _getHeading() {
    if (flightPlanStore.xPlaneData.isNotEmpty) {
      return flightPlanStore.xPlaneData[1036].toInt();
    } else {
      return autopilotStore.heading.toInt();
    }
  }

  int _getAltitude() {
    if (flightPlanStore.xPlaneData.isNotEmpty) {
      return flightPlanStore.xPlaneData[1038].toInt();
    } else {
      return autopilotStore.altitude.toInt();
    }
  }

  int _getVerticalSpeed() {
    if (flightPlanStore.xPlaneData.isNotEmpty) {
      return flightPlanStore.xPlaneData[1037].toInt();
    } else {
      return autopilotStore.verticalSpeed.toInt();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (context) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          AutopilotDisplay(
            value: _getAltitudeValue(),
            text: 'spd',
            onPanUpdate: (d) => autopilotService.panHandler(
                d, 30, autopilotService.setAirspeed),
          ),
          AutopilotDisplay(
            value: _getHeading(),
            text: 'hdg',
            onPanUpdate: (d) =>
                autopilotService.panHandler(d, 30, autopilotService.setHeading),
          ),
          AutopilotDisplay(
            value: _getAltitude(),
            text: 'alt',
            onPanUpdate: (d) => autopilotService.panHandler(
                d, 30, autopilotService.setAltitude),
          ),
          AutopilotDisplay(
            value: _getVerticalSpeed(),
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
