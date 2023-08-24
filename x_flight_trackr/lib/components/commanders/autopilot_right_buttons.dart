import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:x_flight_trackr/components/commanders/autopilot_button.dart';
import 'package:x_flight_trackr/components/commanders/autopilot_display.dart';
import 'package:x_flight_trackr/components/commanders/radial_button.dart';
import 'package:x_flight_trackr/services/commanders/autopilot/autopilot_commander.dart';
import 'package:x_flight_trackr/services/commanders/autopilot/autopilot_service.dart';
import 'package:x_flight_trackr/services/commanders/autopilot/autopilot_status.dart';
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
                onPressed: () => autopilotStore
                    .setAutoThrottle(autopilotStore.autoThrottle == 1 ? 0 : 1),
              ),
              const SizedBox(width: 15),
              AutopilotButton(
                isOn: autopilotStatus.autoThrottleSpeedEnabled(),
                text: 'SPEED',
                onPressed: () {
                  autopilotStore.autoThrottle != 1
                      ? autopilotStore.setAutoThrottle(1)
                      : autopilotStore.setAutoThrottle(0);
                },
              ),
              const SizedBox(width: 15),
              AutopilotButton(
                isOn: autopilotStatus.autoThrottleN1Enabled(),
                text: 'N1',
                onPressed: () {
                  autopilotStore.autoThrottle != 2
                      ? autopilotStore.setAutoThrottle(2)
                      : autopilotStore.setAutoThrottle(1);
                },
              ),
            ],
          ),
          const SizedBox(height: 5),
          AutopilotDisplay(
            withButton: false,
            value: autopilotStore.bankAngle == 0
                ? 'Auto'
                : '${(autopilotStore.bankAngle.toDouble() * 5).toInt()}°',
            text: 'bank',
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              AutopilotButton(
                isOn: autopilotStatus.headingModeEnabled(),
                text: 'HDG',
                onPressed: () => autopilotStore.setHeadingMode(
                    autopilotStore.headingMode == AutoPilotHeadingMode.HDGSEL
                        ? AutoPilotHeadingMode.ROLL
                        : AutoPilotHeadingMode.HDGSEL),
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
                onPressed: () => autopilotStore.setHeadingMode(
                  autopilotStore.headingMode == AutoPilotHeadingMode.GPS
                      ? AutoPilotHeadingMode.ROLL
                      : AutoPilotHeadingMode.GPS,
                ),
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
                onPressed: () => autopilotStore.setAltitudeMode(
                  autopilotStore.altitudeMode == AutoPilotAltitudeMode.PITCH
                      ? AutoPilotAltitudeMode.LEVEL
                      : AutoPilotAltitudeMode.PITCH,
                ),
              ),
              const SizedBox(width: 10),
              AutopilotButton(
                isOn: autopilotStatus.vnavEngaged(),
                text: 'VNAV',
                onPressed: () => autopilotStore.setAltitudeMode(
                  autopilotStore.altitudeMode == AutoPilotAltitudeMode.VNAV
                      ? AutoPilotAltitudeMode.PITCH
                      : AutoPilotAltitudeMode.VNAV,
                ),
              ),
              const SizedBox(width: 10),
              AutopilotButton(
                isOn: autopilotStatus.verticalSpeedEnabled(),
                text: 'V/S',
                onPressed: () => autopilotStore.setAltitudeMode(
                  autopilotStore.altitudeMode == AutoPilotAltitudeMode.VS
                      ? AutoPilotAltitudeMode.LEVEL
                      : AutoPilotAltitudeMode.VS,
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          Row(
            children: [
              AutopilotButton(
                  isOn: autopilotStatus.autopilotEngaged(),
                  text: 'AP',
                  onPressed: () {
                    autopilotStore.setMode(
                      autopilotStore.mode == AutoPilotMode.ON
                          ? AutoPilotMode.OFF
                          : AutoPilotMode.ON,
                    );
                  }),
              const SizedBox(width: 10),
              AutopilotButton(
                isOn: autopilotStatus.glideslopeEnabled(),
                text: 'APP',
                onPressed: () {
                  autopilotStore.altitudeMode != AutoPilotAltitudeMode.GS
                      ? autopilotStore.setAltitudeMode(AutoPilotAltitudeMode.GS)
                      : autopilotStore
                          .setAltitudeMode(AutoPilotAltitudeMode.PITCH);
                },
              ),
              const SizedBox(width: 10),
              AutopilotButton(
                isOn: autopilotStatus.flightDirectorEnabled(),
                text: 'F/D',
                onPressed: () => autopilotStore.setMode(
                  autopilotStore.mode == AutoPilotMode.FD
                      ? AutoPilotMode.ON
                      : AutoPilotMode.FD,
                ),
              ),
            ],
          ),
        ],
      );
    });
  }
}
