import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:x_flight_trackr/components/commanders/Autopilot_button.dart';
import 'package:x_flight_trackr/components/commanders/autopilot_display.dart';
import 'package:x_flight_trackr/components/commanders/radial_button.dart';
import 'package:x_flight_trackr/services/commanders/autopilot/autopilot_commander.dart';
import 'package:x_flight_trackr/services/commanders/autopilot/autopilot_service.dart';
import 'package:x_flight_trackr/store/autopilot_store.dart';

class AutopilotCommander extends StatelessWidget {
  final AutopilotStore autopilotStore;
  final AutopilotService autopilotService;

  AutopilotCommander({super.key, required this.autopilotStore})
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
          Observer(builder: (context) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                AutopilotDisplay(
                  value: autopilotStore.airspeed.toInt(),
                  text: 'spd',
                  onPanUpdate: (d) => autopilotService.panHandler(
                      d, 30, autopilotService.setAirspeed),
                ),
                AutopilotDisplay(
                  value: autopilotStore.heading.toInt(),
                  text: 'hdg',
                  onPanUpdate: (d) => autopilotService.panHandler(
                      d, 30, autopilotService.setHeading),
                ),
                AutopilotDisplay(
                  value: autopilotStore.altitude.toInt(),
                  text: 'alt',
                  onPanUpdate: (d) => autopilotService.panHandler(
                      d, 30, autopilotService.setAltitude),
                ),
                AutopilotDisplay(
                  value: autopilotStore.verticalSpeed.toInt(),
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
                      isOn: autopilotStore.autoThrottle,
                      text: 'A/T',
                      onPressed: () => autopilotStore
                          .setAutoThrottle(!autopilotStore.autoThrottle),
                    ),
                    const SizedBox(width: 15),
                    AutopilotButton(
                        isOn: false, text: 'SPEED', onPressed: () {}),
                    const SizedBox(width: 15),
                    AutopilotButton(isOn: false, text: 'N1', onPressed: () {}),
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
                      isOn: autopilotStore.headingMode ==
                          AutoPilotHeadingMode.HDGSEL,
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
                      isOn: autopilotStore.altitudeMode ==
                          AutoPilotAltitudeMode.PITCH,
                      text: 'ALT',
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
                        isOn: autopilotStore.mode == AutoPilotMode.ON,
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
                      isOn: false,
                      text: 'APP',
                      onPressed: () {},
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
