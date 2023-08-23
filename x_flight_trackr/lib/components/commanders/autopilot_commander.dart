import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:x_flight_trackr/components/commanders/Autopilot_button.dart';
import 'package:x_flight_trackr/components/commanders/autopilot_display.dart';
import 'package:x_flight_trackr/components/commanders/radial_button.dart';
import 'package:x_flight_trackr/services/commanders/autopilot/autopilot_commander.dart';
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

  // NEED REVIEW
  bool _autoThrottleEnabled() {
    if (flightPlanStore.xPlaneData.isNotEmpty) {
      if (flightPlanStore.xPlaneData[1026] > 0) {
        autopilotStore.setAutoThrottle(1);
        return true;
      } else {
        return false;
      }
    } else {
      return autopilotStore.autoThrottle == 1 ||
          autopilotStore.autoThrottle == 2;
    }
  }

  // TODO: speed n1

  bool _headingModeEnabled() {
    if (flightPlanStore.xPlaneData.isNotEmpty) {
      if (flightPlanStore.xPlaneData[1027] > 0) {
        autopilotStore.headingMode = AutoPilotHeadingMode.HDGSEL;
        return true;
      } else {
        return false;
      }
    } else {
      return autopilotStore.headingMode == AutoPilotHeadingMode.HDGSEL;
    }
  }

  bool _altitudeSelEnabled() {
    if (flightPlanStore.xPlaneData.isNotEmpty) {
      if (flightPlanStore.xPlaneData[1018] > 0) {
        return true;
      } else {
        return false;
      }
    } else {
      return autopilotStore.altitudeMode == AutoPilotAltitudeMode.PITCH;
    }
  }

  bool _glideslopeEnabled() {
    if (flightPlanStore.xPlaneData.isNotEmpty) {
      if (flightPlanStore.xPlaneData[1031] > 0) {
        return true;
      } else {
        return false;
      }
    } else {
      return autopilotStore.altitudeMode == AutoPilotAltitudeMode.GS;
    }
  }

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
          Observer(builder: (context) {
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
                  onPanUpdate: (d) => autopilotService.panHandler(
                      d, 30, autopilotService.setHeading),
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
                  onPanUpdate: (d) => autopilotService.panHandler(
                      d, 30, autopilotService.setCourse),
                ),
              ],
            );
          }),
          Observer(builder: (context) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Row(
                  children: [
                    AutopilotButton(
                      // isOn: autopilotStore.autoThrottle == 1 ||
                      //         autopilotStore.autoThrottle == 2
                      //     ? true
                      //     : false,
                      isOn: _autoThrottleEnabled(),
                      text: 'A/T',
                      onPressed: () => autopilotStore.setAutoThrottle(
                          autopilotStore.autoThrottle == 1 ? 0 : 1),
                    ),
                    const SizedBox(width: 15),
                    AutopilotButton(
                      isOn: autopilotStore.autoThrottle == 1 ? true : false,
                      text: 'SPEED',
                      onPressed: () {
                        autopilotStore.autoThrottle != 1
                            ? autopilotStore.setAutoThrottle(1)
                            : autopilotStore.setAutoThrottle(0);
                      },
                    ),
                    const SizedBox(width: 15),
                    AutopilotButton(
                      isOn: autopilotStore.autoThrottle == 2 ? true : false,
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
                      isOn: _headingModeEnabled(),
                      text: 'HDG',
                      onPressed: () => autopilotStore.setHeadingMode(
                          autopilotStore.headingMode ==
                                  AutoPilotHeadingMode.HDGSEL
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
                      isOn: autopilotStore.headingMode ==
                          AutoPilotHeadingMode.NAV,
                      text: 'LNAV',
                      onPressed: () => autopilotStore.setHeadingMode(
                        autopilotStore.headingMode == AutoPilotHeadingMode.NAV
                            ? AutoPilotHeadingMode.ROLL
                            : AutoPilotHeadingMode.NAV,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Row(
                  children: [
                    AutopilotButton(
                      isOn: _altitudeSelEnabled(),
                      text: 'ALT',
                      isArmed: autopilotStore.altitudeMode ==
                          AutoPilotAltitudeMode.VS,
                      onPressed: () => autopilotStore.setAltitudeMode(
                        autopilotStore.altitudeMode ==
                                AutoPilotAltitudeMode.PITCH
                            ? AutoPilotAltitudeMode.LEVEL
                            : AutoPilotAltitudeMode.PITCH,
                      ),
                    ),
                    const SizedBox(width: 10),
                    AutopilotButton(
                      isOn: autopilotStore.altitudeMode ==
                          AutoPilotAltitudeMode.VNAV,
                      text: 'VNAV',
                      onPressed: () => autopilotStore.setAltitudeMode(
                        autopilotStore.altitudeMode ==
                                AutoPilotAltitudeMode.VNAV
                            ? AutoPilotAltitudeMode.LEVEL
                            : AutoPilotAltitudeMode.VNAV,
                      ),
                    ),
                    const SizedBox(width: 10),
                    AutopilotButton(
                      isOn: autopilotStore.altitudeMode ==
                          AutoPilotAltitudeMode.VS,
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
                        isOn: autopilotStore.mode == AutoPilotMode.ON ||
                            autopilotStore.mode == AutoPilotMode.FD,
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
                      isOn: _glideslopeEnabled(),
                      text: 'APP',
                      onPressed: () {
                        autopilotStore.altitudeMode != AutoPilotAltitudeMode.GS
                            ? autopilotStore
                                .setAltitudeMode(AutoPilotAltitudeMode.GS)
                            : autopilotStore
                                .setAltitudeMode(AutoPilotAltitudeMode.FREE);
                      },
                    ),
                    const SizedBox(width: 10),
                    AutopilotButton(
                      isOn: autopilotStore.mode == AutoPilotMode.FD,
                      text: 'F/D',
                      onPressed: () => autopilotStore.setMode(
                        autopilotStore.mode == AutoPilotMode.FD
                            ? AutoPilotMode.OFF
                            : AutoPilotMode.FD,
                      ),
                    ),
                  ],
                ),
              ],
            );
          }),
        ],
      ),
    );
  }
}
