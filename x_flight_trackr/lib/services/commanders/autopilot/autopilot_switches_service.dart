import 'package:x_flight_trackr/services/commanders/autopilot/autopilot_commander.dart';
import 'package:x_flight_trackr/store/autopilot_store.dart';

class AutopilotSwitchesService {
  static void toggleAutoThrottle(AutopilotStore autopilotStore) {
    if (autopilotStore.autoThrottle == 0) {
      autopilotStore.setAutoThrottle(1);
    } else {
      autopilotStore.setAutoThrottle(0);
    }
  }

  static void toggleAutoThrottleSpeed(AutopilotStore autopilotStore) {
    if (autopilotStore.autoThrottle == 1) {
      autopilotStore.setAutoThrottle(2);
    } else {
      autopilotStore.setAutoThrottle(1);
    }
  }

  static String getBankAngle(AutopilotStore autopilotStore) {
    if (autopilotStore.bankAngle == 0) {
      return 'Auto';
    } else {
      return '${(autopilotStore.bankAngle.toDouble() * 5).toInt()}°';
    }
  }

  static void toggleHeadingMode(AutopilotStore autopilotStore) {
    if (autopilotStore.headingMode == AutoPilotHeadingMode.ROLL) {
      autopilotStore.setHeadingMode(AutoPilotHeadingMode.HDGSEL);
    } else {
      autopilotStore.setHeadingMode(AutoPilotHeadingMode.ROLL);
    }
  }

  static void toggleLnav(AutopilotStore autopilotStore) {
    if (autopilotStore.headingMode == AutoPilotHeadingMode.GPS) {
      autopilotStore.setHeadingMode(AutoPilotHeadingMode.ROLL);
    } else {
      autopilotStore.setHeadingMode(AutoPilotHeadingMode.GPS);
    }
  }

  static void toggleAltitude(AutopilotStore autopilotStore) {
    if (autopilotStore.altitudeMode == AutoPilotAltitudeMode.LEVEL) {
      autopilotStore.setAltitudeMode(AutoPilotAltitudeMode.PITCH);
    } else {
      autopilotStore.setAltitudeMode(AutoPilotAltitudeMode.LEVEL);
    }
  }

  static void toggleVnav(AutopilotStore autopilotStore) {
    if (autopilotStore.altitudeMode == AutoPilotAltitudeMode.VNAV) {
      autopilotStore.setAltitudeMode(AutoPilotAltitudeMode.LEVEL);
    } else {
      autopilotStore.setAltitudeMode(AutoPilotAltitudeMode.VNAV);
    }
  }

  static void toggleVerticalSpeed(AutopilotStore autopilotStore) {
    if (autopilotStore.altitudeMode == AutoPilotAltitudeMode.VS) {
      autopilotStore.setAltitudeMode(AutoPilotAltitudeMode.LEVEL);
    } else {
      autopilotStore.setAltitudeMode(AutoPilotAltitudeMode.VS);
    }
  }

  static void toggleAutopilot(AutopilotStore autopilotStore) {
    if (autopilotStore.mode == AutoPilotMode.ON) {
      autopilotStore.setMode(AutoPilotMode.OFF);
    } else {
      autopilotStore.setMode(AutoPilotMode.ON);
    }
  }

  static void toggleGlideSlope(AutopilotStore autopilotStore) {
    if (autopilotStore.altitudeMode == AutoPilotAltitudeMode.GS) {
      autopilotStore.setAltitudeMode(AutoPilotAltitudeMode.PITCH);
    } else {
      autopilotStore.setAltitudeMode(AutoPilotAltitudeMode.GS);
    }
  }

  static void toggleFlightDirector(AutopilotStore autopilotStore) {
    if (autopilotStore.mode == AutoPilotMode.FD) {
      autopilotStore.setMode(AutoPilotMode.OFF);
    } else {
      autopilotStore.setMode(AutoPilotMode.FD);
    }
  }
}
