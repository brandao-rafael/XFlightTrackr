import 'package:mobx/mobx.dart';
import 'package:x_flight_trackr/store/base_commander_store.dart';
import 'package:x_flight_trackr/utils/commanders/autopilot_commander.dart';

part 'autopilot_store.g.dart';

class AutopilotStore = _AutopilotStore with _$AutopilotStore;

abstract class _AutopilotStore extends BaseCommanderStore with Store {
  late AutoPilotCommander autopilotCommander;

  _AutopilotStore() : super() {
    autopilotCommander = AutoPilotCommander(commander: command);
  }
  @observable
  AutoPilotMode mode = AutoPilotMode.OFF;

  @observable
  int bankAngle = 0;

  @observable
  AutoPilotAltitudeMode altitudeMode = AutoPilotAltitudeMode.PITCH;

  @observable
  AutoPilotHeadingMode headingMode = AutoPilotHeadingMode.ROLL;

  @observable
  double altitude = 0;
  @observable
  double heading = 0;
  @observable
  double verticalSpeed = 0;
  @observable
  double airspeed = 0;
  @observable
  bool autoThrottle = false;
  @observable
  double course = 0;

  @action
  Future<void> setMode(AutoPilotMode newMode) async {
    try {
      mode = newMode;
      await autopilotCommander.setAutopilotMode(mode);
    } catch (_) {
      mode = AutoPilotMode.OFF;
    }
  }

  @action
  Future<void> setBankAngle(int newBankAngle) async {
    try {
      if (newBankAngle < 0) {
        bankAngle = 0;
      } else if (newBankAngle >= 6) {
        bankAngle = 6;
      } else {
        bankAngle = newBankAngle;
      }
      await autopilotCommander.setAutoPilotBankAngle(bankAngle);
    } catch (_) {
      bankAngle = 0;
    }
  }

  @action
  Future<void> setAltitudeMode(AutoPilotAltitudeMode newAltitudeMode) async {
    try {
      altitudeMode = newAltitudeMode;
      await autopilotCommander.setAutopilotAltitudeMode(altitudeMode);
    } catch (_) {
      altitudeMode = AutoPilotAltitudeMode.PITCH;
    }
  }

  @action
  Future<void> setHeadingMode(AutoPilotHeadingMode newHeadingMode) async {
    try {
      headingMode = newHeadingMode;
      await autopilotCommander.setAutopilotHeadingMode(headingMode);
    } catch (_) {
      headingMode = AutoPilotHeadingMode.ROLL;
    }
  }

  @action
  Future<void> setAltitude(double newAltitude) async {
    try {
      if (newAltitude < 0) {
        altitude = 0;
      } else if (newAltitude > 50000) {
        altitude = 50000;
      } else {
        altitude = newAltitude;
      }
      await autopilotCommander.setAutopilotAltitude(altitude);
    } catch (_) {
      altitude = 0;
    }
  }

  @action
  Future<void> setHeading(double newHeading) async {
    try {
      if (newHeading < 0) {
        heading = 359;
      } else if (newHeading >= 360) {
        heading = 0;
      } else {
        heading = newHeading;
      }
      await autopilotCommander.setAutopilotHeading(heading);
    } catch (_) {
      heading = 0;
    }
  }

  @action
  Future<void> setVerticalSpeed(double newVerticalSpeed) async {
    try {
      if (newVerticalSpeed < -5000) {
        verticalSpeed = -5000;
      } else if (newVerticalSpeed > 5000) {
        verticalSpeed = 5000;
      } else {
        verticalSpeed = newVerticalSpeed;
      }
      await autopilotCommander.setAutopilotVerticalSpeed(verticalSpeed);
    } catch (_) {
      verticalSpeed = 0;
    }
  }

  @action
  Future<void> setAirspeed(double newAirspeed) async {
    try {
      if (newAirspeed < 0) {
        airspeed = 0;
      } else if (newAirspeed > 500) {
        airspeed = 500;
      } else {
        airspeed = newAirspeed;
      }
      await autopilotCommander.setAutopilotAirspeed(airspeed);
    } catch (_) {
      airspeed = 0;
    }
  }

  @action
  Future<void> setAutoThrottle(bool newAutoThrottle) async {
    try {
      autoThrottle = newAutoThrottle;
      await autopilotCommander.setAutoThrottleEnabled(newAutoThrottle);
    } catch (e) {
      autoThrottle = false;
    }
  }

  @action
  Future<void> setCourse(double newCourse) async {
    try {
      if (newCourse < 0) {
        course = 359;
      } else if (newCourse >= 360) {
        course = 0;
      } else {
        course = newCourse;
      }
      await autopilotCommander.setAutoPilotCourse(course);
    } catch (_) {
      course = 0;
    }
  }
}
