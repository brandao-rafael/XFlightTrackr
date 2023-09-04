import 'package:flutter/material.dart';
import 'package:x_flight_trackr/store/autopilot_store.dart';

class AutopilotService {
  final AutopilotStore autopilotStore;

  AutopilotService(this.autopilotStore);

  void panHandler(DragUpdateDetails d, int radius, void Function(double) set) {
    bool onTop = d.localPosition.dy <= radius;
    bool onLeftSide = d.localPosition.dx <= radius;
    bool onRightSide = !onLeftSide;
    bool onBottom = !onTop;

    bool panUp = d.delta.dy <= 0.0;
    bool panLeft = d.delta.dx <= 0.0;
    bool panRight = !panLeft;
    bool panDown = !panUp;

    double yChange = d.delta.dy.abs();
    double xChange = d.delta.dx.abs();

    double verticalRotation = (onRightSide && panDown) || (onLeftSide && panUp)
        ? yChange
        : yChange * -1;

    double horizontalRotation =
        (onTop && panRight) || (onBottom && panLeft) ? xChange : xChange * -1;

    double rotationalChange = verticalRotation + horizontalRotation;

    if (rotationalChange > 4) {
      set(1000);
    } else if (rotationalChange > 0) {
      set(100);
    } else if (rotationalChange < -4) {
      set(-1000);
    } else if (rotationalChange < 0) {
      set(-100);
    }
  }

  void setAltitude(double value) {
    double altitudeValue = value + autopilotStore.altitude;
    autopilotStore.setAltitude(altitudeValue);
  }

  void setHeading(double value) {
    double headingValue = (value / 100) + autopilotStore.heading;
    autopilotStore.setHeading(headingValue);
  }

  void setVerticalSpeed(double value) {
    double verticalSpeedValue = value + autopilotStore.verticalSpeed;
    autopilotStore.setVerticalSpeed(verticalSpeedValue);
  }

  void setAirspeed(double value) {
    double airspeedValue = (value / 100) + autopilotStore.airspeed;
    autopilotStore.setAirspeed(airspeedValue);
  }

  void setCourse(double value) {
    double courseValue = (value / 100) + autopilotStore.course;
    autopilotStore.setCourse(courseValue);
  }

  void setBankAngle(double value) {
    if (value > 0) {
      autopilotStore.setBankAngle(autopilotStore.bankAngle + 1);
    } else {
      autopilotStore.setBankAngle(autopilotStore.bankAngle - 1);
    }
  }
}
