import 'package:x_flight_trackr/utils/commanders/x_plane_commander.dart';

enum gearPosition { UP, DOWN }

class SystemCommander {
  final XPlaneCommander commander;

  SystemCommander({required this.commander});

  Future<void> setGearUpDown(gearPosition position) async {
    return await commander.sendDref(
        'sim/cockpit2/controls/gear_handle_down', position.index.toDouble());
  }

  Future<void> setFlaps(double flaps) async {
    return await commander.sendDref('sim/flightmodel/controls/flaprqst', flaps);
  }

  Future<void> setSpeedBrakes(double brakes) async {
    return await commander.sendDref(
        'sim/cockpit2/controls/speedbrake_ratio', brakes);
  }

  Future<void> setParkingBrakes(double brakes) async {
    return await commander.sendDref(
        'sim/cockpit2/controls/parking_brake_ratio', brakes);
  }

  Future<void> setAutoBrakes(double brakes) async {
    return await commander.sendDref(
        'sim/cockpit2/switches/auto_brake_level', brakes);
  }

  Future<void> setReverseThrustOrThrottle(double thrust) async {
    return await commander.sendDref(
        'sim/cockpit2/engine/actuators/throttle_jet_rev_ratio_all', thrust);
  }
}
