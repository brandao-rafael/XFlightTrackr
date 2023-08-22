// ignore_for_file: constant_identifier_names

import 'package:x_flight_trackr/utils/commanders/x_plane_commander.dart';

enum AutoPilotMode { OFF, FD, ON }

enum AutoPilotAltitudeMode {
  PITCH,
  VS,
  LEVEL,
  ALTHOLD,
  TERRAIN,
  GS,
  VNAV,
  TOGA,
  REENTRY,
  FREE,
  FLARE,
  FLIGHTPATH,
  VNAVSPD,
}

enum AutoPilotHeadingMode { ROLL, HDGSEL, NAV }

class AutoPilotCommander {
  final XPlaneCommander commander;

  AutoPilotCommander({required this.commander});

  double _getAltitudeModeValue(AutoPilotAltitudeMode mode) {
    switch (mode) {
      case AutoPilotAltitudeMode.PITCH:
        return 3;
      case AutoPilotAltitudeMode.VS:
        return 4;
      case AutoPilotAltitudeMode.LEVEL:
        return 5;
      case AutoPilotAltitudeMode.ALTHOLD:
        return 6;
      case AutoPilotAltitudeMode.TERRAIN:
        return 7;
      case AutoPilotAltitudeMode.GS:
        return 8;
      case AutoPilotAltitudeMode.VNAV:
        return 9;
      case AutoPilotAltitudeMode.TOGA:
        return 10;
      case AutoPilotAltitudeMode.REENTRY:
        return 11;
      case AutoPilotAltitudeMode.FREE:
        return 12;
      case AutoPilotAltitudeMode.FLARE:
        return 17;
      case AutoPilotAltitudeMode.FLIGHTPATH:
        return 19;
      case AutoPilotAltitudeMode.VNAVSPD:
        return 20;
    }
  }

  Future<void> setAutopilotAltitude(double altitude) async {
    await commander.sendDref('sim/cockpit/autopilot/altitude', altitude);
  }

  Future<void> setAutopilotAirspeed(double airspeed) async {
    await commander.sendDref('sim/cockpit/autopilot/airspeed', airspeed);
  }

  Future<void> setAutopilotHeading(double heading) async {
    await commander.sendDref('sim/cockpit/autopilot/heading_mag', heading);
  }

  Future<void> setAutopilotVerticalSpeed(double verticalSpeed) async {
    await commander.sendDref(
        'sim/cockpit/autopilot/vertical_velocity', verticalSpeed);
  }

  Future<void> setAutoThrottleEnabled(bool enabled) async {
    await commander.sendDref(
        'sim/cockpit2/autopilot/autothrottle_enabled', enabled ? 1 : 0);
  }

  Future<void> setAutopilotMode(AutoPilotMode mode) async {
    await commander.sendDref(
        'sim/cockpit/autopilot/autopilot_mode', mode.index.toDouble());
  }

  Future<void> setAutoPilotBankAngle(int angle) async {
    // sim/cockpit2/autopilot/bank_angle_mode
    await commander.sendDref(
        'sim/cockpit/autopilot/heading_roll_mode', angle.toDouble());
  }

  Future<void> setAutoPilotCourse(double course) async {
    await commander.sendDref(
        'sim/cockpit2/radios/actuators/hsi_obs_deg_mag_pilot', course);
  }

  // Review: See about overriding the default values for the autopilot
  Future<void> setAutopilotAltitudeMode(AutoPilotAltitudeMode mode) async {
    await commander.sendDref(
        'sim/cockpit/autopilot/altitude_mode', _getAltitudeModeValue(mode));
  }

  Future<void> setAutopilotHeadingMode(AutoPilotHeadingMode mode) async {
    await commander.sendDref(
        'sim/cockpit/autopilot/heading_mode', mode.index.toDouble());
  }
}
