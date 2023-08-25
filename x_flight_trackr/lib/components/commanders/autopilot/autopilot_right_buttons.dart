import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:x_flight_trackr/components/commanders/autopilot/autopilot_button.dart';
import 'package:x_flight_trackr/components/commanders/autopilot/autopilot_display.dart';
import 'package:x_flight_trackr/components/commanders/autopilot/radial_button.dart';
import 'package:x_flight_trackr/services/commanders/autopilot/autopilot_service.dart';
import 'package:x_flight_trackr/services/commanders/autopilot/autopilot_status_service.dart';
import 'package:x_flight_trackr/services/commanders/autopilot/autopilot_switches_service.dart';
import 'package:x_flight_trackr/store/autopilot_store.dart';
import 'package:x_flight_trackr/store/flight_plan_store.dart';

class AutopilotRightButtons extends StatelessWidget {
  final AutopilotStore autopilotStore;
  final AutopilotService autopilotService;
  final FlightPlanStore flightPlanStore;

  final AutopilotStatusService autopilotStatus;

  AutopilotRightButtons({
    super.key,
    required this.autopilotStore,
    required this.autopilotService,
    required this.flightPlanStore,
  }) : autopilotStatus = AutopilotStatusService(
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
                    AutopilotSwitchesService.toggleAutoThrottle(autopilotStore),
              ),
              const SizedBox(width: 15),
              AutopilotButton(
                isOn: autopilotStatus.autoThrottleSpeedEnabled(),
                text: 'SPEED',
                onPressed: () =>
                    AutopilotSwitchesService.toggleAutoThrottleSpeed(
                        autopilotStore),
              ),
              const SizedBox(width: 15),
              AutopilotButton(
                isOn: autopilotStatus.autoThrottleN1Enabled(),
                text: 'N1',
                onPressed: () =>
                    AutopilotSwitchesService.toggleAutoThrottleSpeed(
                        autopilotStore),
              ),
            ],
          ),
          const SizedBox(height: 5),
          AutopilotDisplay(
            withButton: false,
            value: AutopilotSwitchesService.getBankAngle(autopilotStore),
            text: 'bank',
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              AutopilotButton(
                isOn: autopilotStatus.headingModeEnabled(),
                text: 'HDG',
                onPressed: () =>
                    AutopilotSwitchesService.toggleHeadingMode(autopilotStore),
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
                onPressed: () =>
                    AutopilotSwitchesService.toggleLnav(autopilotStore),
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
                    AutopilotSwitchesService.toggleAltitude(autopilotStore),
              ),
              const SizedBox(width: 10),
              AutopilotButton(
                isOn: autopilotStatus.vnavEngaged(),
                text: 'VNAV',
                onPressed: () =>
                    AutopilotSwitchesService.toggleVnav(autopilotStore),
              ),
              const SizedBox(width: 10),
              AutopilotButton(
                isOn: autopilotStatus.verticalSpeedEnabled(),
                text: 'V/S',
                onPressed: () => AutopilotSwitchesService.toggleVerticalSpeed(
                    autopilotStore),
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
                    AutopilotSwitchesService.toggleAutopilot(autopilotStore),
              ),
              const SizedBox(width: 10),
              AutopilotButton(
                isOn: autopilotStatus.glideslopeEnabled(),
                text: 'APP',
                onPressed: () =>
                    AutopilotSwitchesService.toggleGlideSlope(autopilotStore),
              ),
              const SizedBox(width: 10),
              AutopilotButton(
                isOn: autopilotStatus.flightDirectorEnabled(),
                text: 'F/D',
                onPressed: () => AutopilotSwitchesService.toggleFlightDirector(
                    autopilotStore),
              ),
            ],
          ),
        ],
      );
    });
  }
}
