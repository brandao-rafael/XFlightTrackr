// ignore_for_file: constant_identifier_names

import 'dart:convert';
import 'dart:typed_data';
import 'package:udp/udp.dart';
import 'dart:io';

enum AutoPilotMode { OFF, FD, ON }

enum AutoPilotBankAngle { AUTO, FIVE, TEN, FIFTEEN, TWENTY, TWENTYFIVE, THIRTY }

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

class XPlaneCommander {
  final String xplaneAddress;
  final int xplanePort;

  XPlaneCommander({required this.xplaneAddress, required this.xplanePort});

  Future<void> sendDref(String dref, dynamic value) async {
    var udp = await UDP.bind(Endpoint.any());

    // Create the message
    var message = Uint8List(509); // 5 + 4 + 500 bytes
    var buffer = ByteData.sublistView(message);

    // Set the "DREF0" header
    buffer.setUint8(0, 'D'.codeUnitAt(0));
    buffer.setUint8(1, 'R'.codeUnitAt(0));
    buffer.setUint8(2, 'E'.codeUnitAt(0));
    buffer.setUint8(3, 'F'.codeUnitAt(0));
    buffer.setUint8(4, '0'.codeUnitAt(0));

    // Set the float value
    buffer.setFloat32(5, value, Endian.little);

    // Set the dataref string
    var drefBytes = utf8.encode(dref);
    for (int i = 0; i < drefBytes.length; i++) {
      buffer.setUint8(9 + i, drefBytes[i]);
    }

    // Send the message
    await udp.send(
        message,
        Endpoint.unicast(InternetAddress(xplaneAddress),
            port: Port(xplanePort)));
  }

  int _getAltitudeModeValue(AutoPilotAltitudeMode mode) {
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
    await sendDref('sim/cockpit/autopilot/altitude', altitude);
  }

  Future<void> setAutopilotAirspeed(double airspeed) async {
    await sendDref('sim/cockpit/autopilot/airspeed', airspeed);
  }

  Future<void> setAutopilotHeading(double heading) async {
    await sendDref('sim/cockpit/autopilot/heading_mag', heading);
  }

  Future<void> setAutopilotVerticalSpeed(double verticalSpeed) async {
    await sendDref('sim/cockpit/autopilot/vertical_velocity', verticalSpeed);
  }

  Future<void> setAutoThrottleEnabled(bool enabled) async {
    await sendDref(
        'sim/cockpit2/autopilot/autothrottle_enabled', enabled ? 1 : 0);
  }

  Future<void> setAutopilotMode(AutoPilotMode mode) async {
    await sendDref('sim/cockpit/autopilot/autopilot_mode', mode.index);
  }

  Future<void> setAutoPilotBankAngle(AutoPilotBankAngle angle) async {
    await sendDref('sim/cockpit/autopilot/heading_roll_mode', angle.index);
  }

  // Review: See about overriding the default values for the autopilot
  Future<void> setAutopilotAltitudeMode(AutoPilotAltitudeMode mode) async {
    await sendDref(
        'sim/cockpit/autopilot/altitude_mode', _getAltitudeModeValue(mode));
  }

  Future<void> setAutopilotHeadingMode(AutoPilotHeadingMode mode) async {
    await sendDref('sim/cockpit/autopilot/heading_mode', mode.index);
  }
}
