import 'package:mobx/mobx.dart';
import 'package:x_flight_trackr/store/base_commander_store.dart';
import 'package:x_flight_trackr/utils/commanders/system_commander.dart';

part 'systems_commander_store.g.dart';

class SystemsCommanderStore = _SystemsCommanderStore
    with _$SystemsCommanderStore;

abstract class _SystemsCommanderStore extends BaseCommanderStore with Store {
  late SystemCommander systemCommander;

  _SystemsCommanderStore() : super() {
    systemCommander = SystemCommander(commander: command);
  }

  @observable
  GearPosition gearPosition = GearPosition.UP;

  @observable
  double flapsPosition = 0;

  @observable
  double speedBrakePosition = 0;

  @observable
  double parkingBrakePosition = 0;

  @observable
  double throttlePosition = 0;

  @observable
  double reversePosition = 0;

  @observable
  double autoBrakePosition = 0;

  @action
  Future<void> setGearPosition(GearPosition newGearPosition) async {
    try {
      gearPosition = newGearPosition;
      await systemCommander.setGearUpDown(gearPosition);
    } catch (_) {
      gearPosition = GearPosition.UP;
    }
  }

  @action
  Future<void> setFlapsPosition(double newFlapsPosition) async {
    try {
      flapsPosition = newFlapsPosition;
      await systemCommander.setFlaps(flapsPosition);
    } catch (_) {
      flapsPosition = 0;
    }
  }

  @action
  Future<void> setSpeedBrakePosition(double newSpeedBrakePosition) async {
    try {
      speedBrakePosition = newSpeedBrakePosition;
      await systemCommander.setSpeedBrakes(speedBrakePosition);
    } catch (_) {
      speedBrakePosition = 0;
    }
  }

  @action
  Future<void> setParkingBrakePosition(double newParkingBrakePosition) async {
    try {
      parkingBrakePosition = newParkingBrakePosition;
      await systemCommander.setParkingBrakes(parkingBrakePosition);
    } catch (_) {
      parkingBrakePosition = 0;
    }
  }

  @action
  Future<void> setAutoBrakePosition(double newAutoBrakePosition) async {
    try {
      autoBrakePosition = newAutoBrakePosition;
      await systemCommander.setAutoBrakes(autoBrakePosition);
    } catch (_) {
      autoBrakePosition = 0;
    }
  }

  @action
  Future<void> setThrottlePosition(double newThrottlePosition) async {
    try {
      throttlePosition = newThrottlePosition;
      await systemCommander.setReverseThrustOrThrottle(throttlePosition);
    } catch (_) {
      throttlePosition = 0;
    }
  }

  @action
  Future<void> setReversePosition(double newReversePosition) async {
    try {
      reversePosition = newReversePosition;
      await systemCommander.setReverseThrustOrThrottle(reversePosition);
    } catch (_) {
      reversePosition = 0;
    }
  }
}
