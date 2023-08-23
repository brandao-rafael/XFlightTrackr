// ignore_for_file: constant_identifier_names

import 'package:x_flight_trackr/services/commanders/x_plane_commander.dart';

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

  Future<void> setAutoThrottleEnabled(int enabled) async {
    await commander.sendDref(
        'sim/cockpit2/autopilot/autothrottle_enabled', enabled.toDouble());
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

  Future<void> _overrideAutopilot() async {
    await commander.sendDref('sim/operation/override/override_autopilot/', 1);
  }

  Future<void> _disableOverrideAutopilot() async {
    await commander.sendDref('sim/operation/override/override_autopilot/', 0);
  }

  Future<void> setAutopilotAltitudeMode(AutoPilotAltitudeMode mode) async {
    await _overrideAutopilot();
    switch (mode) {
      case AutoPilotAltitudeMode.PITCH:
        await commander.sendDref('sim/cockpit/autopilot/autopilot_state',
            128); // 128 corresponds to Pitch Hold Engage
        break;
      case AutoPilotAltitudeMode.VS:
        await commander.sendDref('sim/cockpit/autopilot/autopilot_state',
            16); // 16 corresponds to V/S Engage
        break;
      case AutoPilotAltitudeMode.LEVEL:
        await commander.sendDref('sim/cockpit/autopilot/autopilot_state',
            16384); // 16384 corresponds to Altitude Hold Engaged
        break;
      case AutoPilotAltitudeMode.ALTHOLD:
        await commander.sendDref('sim/cockpit/autopilot/autopilot_state',
            32); // 32 corresponds to Altitude Hold Arm
        break;
      case AutoPilotAltitudeMode.VNAV:
        await commander.sendDref('sim/cockpit/autopilot/autopilot_state',
            262144); // 262144 corresponds to VNAV Path Engaged
        break;
      case AutoPilotAltitudeMode.GS:
        await commander.sendDref('sim/cockpit/autopilot/autopilot_state',
            2048); // 2048 corresponds to Glide Slope Engaged
        break;
      default:
        await commander.sendDref('sim/cockpit/autopilot/autopilot_state', 0);
        break;
    }
    await _disableOverrideAutopilot();
  }

  Future<void> setAutopilotHeadingMode(AutoPilotHeadingMode mode) async {
    await _overrideAutopilot();
    if (mode == AutoPilotHeadingMode.HDGSEL) {
      await commander.sendDref('sim/cockpit/autopilot/autopilot_state',
          2); // 2 corresponds to Heading Select Engage
    } else if (mode == AutoPilotHeadingMode.ROLL) {
      await commander.sendDref('sim/cockpit/autopilot/autopilot_state',
          4); // 4 corresponds to Roll Hold Engage
    } else if (mode == AutoPilotHeadingMode.NAV) {
      await commander.sendDref('sim/cockpit/autopilot/autopilot_state',
          512); // 512 corresponds to Nav Engaged
    }
    await _disableOverrideAutopilot();
  }
}
