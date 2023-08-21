import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import 'package:x_flight_trackr/components/commanders/Autopilot_button.dart';
import 'package:x_flight_trackr/components/commanders/autopilot_display.dart';
import 'package:x_flight_trackr/components/commanders/radial_button.dart';
import 'package:x_flight_trackr/store/autopilot_store.dart';

class AutopilotCommander extends StatelessWidget {
  const AutopilotCommander({super.key});

  bool exists(int index, List<double> list) {
    try {
      // ignore: unnecessary_null_comparison
      if (list[index] != null) {
        return true;
      } else {
        return false;
      }
    } on RangeError {
      return false;
    } catch (_) {
      return false;
    }
  }

  // code from https://fireship.io/snippets/circular-drag-flutter/
  void _panHandler(DragUpdateDetails d, int radius, AutopilotStore store,
      void Function(double) set) {
    /// Pan location on the wheel
    bool onTop = d.localPosition.dy <= radius;
    bool onLeftSide = d.localPosition.dx <= radius;
    bool onRightSide = !onLeftSide;
    bool onBottom = !onTop;

    /// Pan movements
    bool panUp = d.delta.dy <= 0.0;
    bool panLeft = d.delta.dx <= 0.0;
    bool panRight = !panLeft;
    bool panDown = !panUp;

    /// Absoulte change on axis
    double yChange = d.delta.dy.abs();
    double xChange = d.delta.dx.abs();

    /// Directional change on wheel
    double verticalRotation = (onRightSide && panDown) || (onLeftSide && panUp)
        ? yChange
        : yChange * -1;

    double horizontalRotation =
        (onTop && panRight) || (onBottom && panLeft) ? xChange : xChange * -1;

    // Total computed change
    double rotationalChange = verticalRotation + horizontalRotation;

    bool movingClockwise = rotationalChange > 0;
    bool movingCounterClockwise = rotationalChange < 0;

    if (rotationalChange.abs() > 2) {
      set(1000);
    } else if (rotationalChange.abs() > 0) {
      set(100);
    } else if (rotationalChange.abs() < -2) {
      set(-1000);
    } else if (rotationalChange.abs() < 0) {
      set(-100);
    }

    print(movingClockwise);
    print(movingCounterClockwise);
    print(rotationalChange);

    // Now do something interesting with these computations!
  }

  void _setAltitude(double value) {
    print(value);
  }

  void _setHeading(double value) {}

  void _setVerticalSpeed(double value) {}

  void _setAirspeed(double value) {}

  void _setCourse(double value) {}

  void _setBankAngle(double value) {}

  @override
  Widget build(BuildContext context) {
    AutopilotStore autopilotStore = Provider.of<AutopilotStore>(context);
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
          Observer(builder: (_) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                AutopilotDisplay(
                  value: autopilotStore.airspeed,
                  text: 'spd',
                  onPanUpdate: (d) =>
                      _panHandler(d, 30, autopilotStore, _setAirspeed),
                ),
                AutopilotDisplay(
                  value: autopilotStore.heading,
                  text: 'hdg',
                  onPanUpdate: (d) =>
                      _panHandler(d, 30, autopilotStore, _setHeading),
                ),
                AutopilotDisplay(
                  value: autopilotStore.altitude,
                  text: 'alt',
                  onPanUpdate: (d) =>
                      _panHandler(d, 30, autopilotStore, _setAltitude),
                ),
                AutopilotDisplay(
                  value: autopilotStore.verticalSpeed,
                  text: 'vs',
                  onPanUpdate: (d) =>
                      _panHandler(d, 30, autopilotStore, _setVerticalSpeed),
                ),
                AutopilotDisplay(
                  value: autopilotStore.course,
                  text: 'crs',
                  onPanUpdate: (d) =>
                      _panHandler(d, 30, autopilotStore, _setCourse),
                ),
              ],
            );
          }),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Row(
                children: [
                  AutopilotButton(isOn: false, text: 'A/T', onPressed: () {}),
                  const SizedBox(width: 15),
                  AutopilotButton(isOn: false, text: 'SPEED', onPressed: () {}),
                  const SizedBox(width: 15),
                  AutopilotButton(isOn: false, text: 'N1', onPressed: () {}),
                ],
              ),
              const SizedBox(height: 5),
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  AutopilotButton(
                    isOn: true,
                    text: 'HDG',
                    onPressed: () {},
                  ),
                  const SizedBox(width: 10),
                  RadialButton(
                    icon: Icons.text_rotation_angleup_outlined,
                    text: 'Bank A.',
                    radius: 25,
                    onPanUpdate: (d) =>
                        _panHandler(d, 25, autopilotStore, _setBankAngle),
                  ),
                  const SizedBox(width: 10),
                  AutopilotButton(isOn: false, text: 'LNAV', onPressed: () {}),
                ],
              ),
              const SizedBox(height: 20),
              Row(
                children: [
                  AutopilotButton(
                    isOn: true,
                    text: 'ALT',
                    onPressed: () {},
                  ),
                  const SizedBox(width: 10),
                  AutopilotButton(isOn: false, text: 'VNAV', onPressed: () {}),
                  const SizedBox(width: 10),
                  AutopilotButton(isOn: true, text: 'V/S', onPressed: () {}),
                ],
              ),
              const SizedBox(height: 20),
              Row(
                children: [
                  AutopilotButton(isOn: false, text: 'AP', onPressed: () {}),
                  const SizedBox(width: 10),
                  AutopilotButton(
                    isOn: false,
                    text: 'APP',
                    onPressed: () {},
                  ),
                  const SizedBox(width: 10),
                  AutopilotButton(isOn: false, text: 'F/D', onPressed: () {}),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
