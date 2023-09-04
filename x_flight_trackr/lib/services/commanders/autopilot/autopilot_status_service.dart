import 'package:x_flight_trackr/services/commanders/autopilot/autopilot_commander.dart';
import 'package:x_flight_trackr/store/autopilot_store.dart';
import 'package:x_flight_trackr/store/flight_plan_store.dart';

class AutopilotStatusService {
  FlightPlanStore flightPlanStore;
  AutopilotStore autopilotStore;

  AutopilotStatusService(
      {required this.flightPlanStore, required this.autopilotStore});

  int getAltitudeValue() {
    if (flightPlanStore.xPlaneData.isNotEmpty) {
      return flightPlanStore.xPlaneData[1035].toInt();
    } else {
      return autopilotStore.airspeed.toInt();
    }
  }

  int getHeading() {
    if (flightPlanStore.xPlaneData.isNotEmpty) {
      return flightPlanStore.xPlaneData[1036].toInt();
    } else {
      return autopilotStore.heading.toInt();
    }
  }

  int getAltitude() {
    if (flightPlanStore.xPlaneData.isNotEmpty) {
      return flightPlanStore.xPlaneData[1038].toInt();
    } else {
      return autopilotStore.altitude.toInt();
    }
  }

  int getVerticalSpeed() {
    if (flightPlanStore.xPlaneData.isNotEmpty) {
      return flightPlanStore.xPlaneData[1037].toInt();
    } else {
      return autopilotStore.verticalSpeed.toInt();
    }
  }

  bool flightDirectorEnabled() {
    if (flightPlanStore.xPlaneData.isNotEmpty) {
      if (flightPlanStore.xPlaneData[946] >= 1) {
        return true;
      } else {
        return false;
      }
    } else {
      return autopilotStore.mode == AutoPilotMode.FD;
    }
  }

  bool autopilotEngaged() {
    if (flightPlanStore.xPlaneData.isNotEmpty) {
      if (flightPlanStore.xPlaneData[946] == 2) {
        return true;
      } else {
        return false;
      }
    } else {
      return autopilotStore.mode == AutoPilotMode.ON ||
          autopilotStore.mode == AutoPilotMode.FD;
    }
  }

  bool autoThrottleSpeedEnabled() {
    if (flightPlanStore.xPlaneData.isNotEmpty) {
      if (flightPlanStore.xPlaneData[1026] == 1) {
        return true;
      } else {
        return false;
      }
    } else {
      return autopilotStore.autoThrottle == 1;
    }
  }

  bool autoThrottleN1Enabled() {
    if (flightPlanStore.xPlaneData.isNotEmpty) {
      if (flightPlanStore.xPlaneData[1026] == 2) {
        return true;
      } else {
        return false;
      }
    } else {
      return autopilotStore.autoThrottle == 2;
    }
  }

  bool headingModeEnabled() {
    if (flightPlanStore.xPlaneData.isNotEmpty) {
      if (flightPlanStore.xPlaneData[1027] == 1) {
        return true;
      } else {
        return false;
      }
    } else {
      return autopilotStore.headingMode == AutoPilotHeadingMode.HDGSEL;
    }
  }

  bool altitudeSelEnabled() {
    if (flightPlanStore.xPlaneData.isNotEmpty) {
      if (flightPlanStore.xPlaneData[1028].toInt() == 6) {
        return true;
      } else {
        return false;
      }
    } else {
      return autopilotStore.altitudeMode == AutoPilotAltitudeMode.LEVEL;
    }
  }

  bool verticalSpeedEnabled() {
    if (flightPlanStore.xPlaneData.isNotEmpty) {
      if (flightPlanStore.xPlaneData[1028].toInt() == 4) {
        return true;
      } else {
        return false;
      }
    } else {
      return autopilotStore.altitudeMode == AutoPilotAltitudeMode.VS;
    }
  }

  bool vnavEngaged() {
    if (flightPlanStore.xPlaneData.isNotEmpty) {
      if (flightPlanStore.xPlaneData[1028].toInt() == 5 ||
          flightPlanStore.xPlaneData[1028].toInt() == 9 ||
          flightPlanStore.xPlaneData[1028].toInt() == 10 ||
          flightPlanStore.xPlaneData[1028].toInt() == 20) {
        return true;
      } else {
        return false;
      }
    } else {
      return autopilotStore.altitudeMode == AutoPilotAltitudeMode.VNAV;
    }
  }

  bool glideslopeEnabled() {
    if (flightPlanStore.xPlaneData.isNotEmpty) {
      if (flightPlanStore.xPlaneData[1031].toInt() > 0) {
        return true;
      } else {
        return false;
      }
    } else {
      return autopilotStore.altitudeMode == AutoPilotAltitudeMode.GS;
    }
  }

  bool lnavEngaged() {
    if (flightPlanStore.xPlaneData.isNotEmpty) {
      if (flightPlanStore.xPlaneData[1027].toInt() == 13) {
        return true;
      } else {
        return false;
      }
    } else {
      return autopilotStore.headingMode == AutoPilotHeadingMode.GPS;
    }
  }

  bool altitudeIsArmed() {
    if (flightPlanStore.xPlaneData.isNotEmpty) {
      if (flightPlanStore.xPlaneData[1028].toInt() == 4) {
        return true;
      } else {
        return false;
      }
    } else {
      return autopilotStore.altitudeMode == AutoPilotAltitudeMode.VS;
    }
  }
}
