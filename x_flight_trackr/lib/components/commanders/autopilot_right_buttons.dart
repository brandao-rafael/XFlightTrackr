import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:x_flight_trackr/components/commanders/autopilot_button.dart';
import 'package:x_flight_trackr/components/commanders/autopilot_display.dart';
import 'package:x_flight_trackr/components/commanders/radial_button.dart';
import 'package:x_flight_trackr/services/commanders/autopilot/autopilot_service.dart';
import 'package:x_flight_trackr/services/commanders/autopilot/autopilot_status.dart';
import 'package:x_flight_trackr/services/commanders/autopilot/autopilot_switches.dart';
import 'package:x_flight_trackr/store/autopilot_store.dart';
import 'package:x_flight_trackr/store/flight_plan_store.dart';

class AutopilotRightButtons extends StatelessWidget {
  final AutopilotStore autopilotStore;
  final AutopilotService autopilotService;
  final FlightPlanStore flightPlanStore;

  final AutopilotStatus autopilotStatus;

  AutopilotRightButtons({
    super.key,
    required this.autopilotStore,
    required this.autopilotService,
    required this.flightPlanStore,
  }) : autopilotStatus = AutopilotStatus(
          flightPlanStore: flightPlanStore,
          autopilotStore: autopilotStore,
        );

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (context) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Row(
            children: [
              AutopilotButton(
                isOn: autopilotStatus.autoThrottleSpeedEnabled() ||
                    autopilotStatus.autoThrottleN1Enabled(),
                text: 'A/T',
                onPressed: () =>
                    AutopilotSwitches.toggleAutoThrottle(autopilotStore),
              ),
              const SizedBox(width: 15),
              AutopilotButton(
                isOn: autopilotStatus.autoThrottleSpeedEnabled(),
                text: 'SPEED',
                onPressed: () =>
                    AutopilotSwitches.toggleAutoThrottleSpeed(autopilotStore),
              ),
              const SizedBox(width: 15),
              AutopilotButton(
                isOn: autopilotStatus.autoThrottleN1Enabled(),
                text: 'N1',
                onPressed: () =>
                    AutopilotSwitches.toggleAutoThrottleSpeed(autopilotStore),
              ),
            ],
          ),
          const SizedBox(height: 5),
          AutopilotDisplay(
            withButton: false,
            value: AutopilotSwitches.getBankAngle(autopilotStore),
            text: 'bank',
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              AutopilotButton(
                isOn: autopilotStatus.headingModeEnabled(),
                text: 'HDG',
                onPressed: () =>
                    AutopilotSwitches.toggleHeadingMode(autopilotStore),
              ),
              const SizedBox(width: 10),
              RadialButton(
                icon: Icons.text_rotation_angleup,
                radius: 25,
                onPanUpdate: (d) => autopilotService.panHandler(
                    d, 25, autopilotService.setBankAngle),
              ),
              const SizedBox(width: 10),
              AutopilotButton(
                isOn: autopilotStatus.lnavEngaged(),
                text: 'LNAV',
                onPressed: () => AutopilotSwitches.toggleLnav(autopilotStore),
              ),
            ],
          ),
          const SizedBox(height: 20),
          Row(
            children: [
              AutopilotButton(
                isOn: autopilotStatus.altitudeSelEnabled(),
                text: 'ALT',
                isArmed: autopilotStatus.altitudeIsArmed(),
                onPressed: () =>
                    AutopilotSwitches.toggleAltitude(autopilotStore),
              ),
              const SizedBox(width: 10),
              AutopilotButton(
                isOn: autopilotStatus.vnavEngaged(),
                text: 'VNAV',
                onPressed: () => AutopilotSwitches.toggleVnav(autopilotStore),
              ),
              const SizedBox(width: 10),
              AutopilotButton(
                isOn: autopilotStatus.verticalSpeedEnabled(),
                text: 'V/S',
                onPressed: () =>
                    AutopilotSwitches.toggleVerticalSpeed(autopilotStore),
              ),
            ],
          ),
          const SizedBox(height: 20),
          Row(
            children: [
              AutopilotButton(
                isOn: autopilotStatus.autopilotEngaged(),
                text: 'AP',
                onPressed: () =>
                    AutopilotSwitches.toggleAutopilot(autopilotStore),
              ),
              const SizedBox(width: 10),
              AutopilotButton(
                isOn: autopilotStatus.glideslopeEnabled(),
                text: 'APP',
                onPressed: () =>
                    AutopilotSwitches.toggleGlideSlope(autopilotStore),
              ),
              const SizedBox(width: 10),
              AutopilotButton(
                isOn: autopilotStatus.flightDirectorEnabled(),
                text: 'F/D',
                onPressed: () =>
                    AutopilotSwitches.toggleFlightDirector(autopilotStore),
              ),
            ],
          ),
        ],
      );
    });
  }
}
