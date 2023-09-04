// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'systems_commander_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$SystemsCommanderStore on _SystemsCommanderStore, Store {
  late final _$gearPositionAtom =
      Atom(name: '_SystemsCommanderStore.gearPosition', context: context);

  @override
  GearPosition get gearPosition {
    _$gearPositionAtom.reportRead();
    return super.gearPosition;
  }

  @override
  set gearPosition(GearPosition value) {
    _$gearPositionAtom.reportWrite(value, super.gearPosition, () {
      super.gearPosition = value;
    });
  }

  late final _$flapsPositionAtom =
      Atom(name: '_SystemsCommanderStore.flapsPosition', context: context);

  @override
  double get flapsPosition {
    _$flapsPositionAtom.reportRead();
    return super.flapsPosition;
  }

  @override
  set flapsPosition(double value) {
    _$flapsPositionAtom.reportWrite(value, super.flapsPosition, () {
      super.flapsPosition = value;
    });
  }

  late final _$speedBrakePositionAtom =
      Atom(name: '_SystemsCommanderStore.speedBrakePosition', context: context);

  @override
  double get speedBrakePosition {
    _$speedBrakePositionAtom.reportRead();
    return super.speedBrakePosition;
  }

  @override
  set speedBrakePosition(double value) {
    _$speedBrakePositionAtom.reportWrite(value, super.speedBrakePosition, () {
      super.speedBrakePosition = value;
    });
  }

  late final _$parkingBrakePositionAtom = Atom(
      name: '_SystemsCommanderStore.parkingBrakePosition', context: context);

  @override
  double get parkingBrakePosition {
    _$parkingBrakePositionAtom.reportRead();
    return super.parkingBrakePosition;
  }

  @override
  set parkingBrakePosition(double value) {
    _$parkingBrakePositionAtom.reportWrite(value, super.parkingBrakePosition,
        () {
      super.parkingBrakePosition = value;
    });
  }

  late final _$throttlePositionAtom =
      Atom(name: '_SystemsCommanderStore.throttlePosition', context: context);

  @override
  double get throttlePosition {
    _$throttlePositionAtom.reportRead();
    return super.throttlePosition;
  }

  @override
  set throttlePosition(double value) {
    _$throttlePositionAtom.reportWrite(value, super.throttlePosition, () {
      super.throttlePosition = value;
    });
  }

  late final _$reversePositionAtom =
      Atom(name: '_SystemsCommanderStore.reversePosition', context: context);

  @override
  double get reversePosition {
    _$reversePositionAtom.reportRead();
    return super.reversePosition;
  }

  @override
  set reversePosition(double value) {
    _$reversePositionAtom.reportWrite(value, super.reversePosition, () {
      super.reversePosition = value;
    });
  }

  late final _$autoBrakePositionAtom =
      Atom(name: '_SystemsCommanderStore.autoBrakePosition', context: context);

  @override
  double get autoBrakePosition {
    _$autoBrakePositionAtom.reportRead();
    return super.autoBrakePosition;
  }

  @override
  set autoBrakePosition(double value) {
    _$autoBrakePositionAtom.reportWrite(value, super.autoBrakePosition, () {
      super.autoBrakePosition = value;
    });
  }

  late final _$setGearPositionAsyncAction =
      AsyncAction('_SystemsCommanderStore.setGearPosition', context: context);

  @override
  Future<void> setGearPosition(GearPosition newGearPosition) {
    return _$setGearPositionAsyncAction
        .run(() => super.setGearPosition(newGearPosition));
  }

  late final _$setFlapsPositionAsyncAction =
      AsyncAction('_SystemsCommanderStore.setFlapsPosition', context: context);

  @override
  Future<void> setFlapsPosition(double newFlapsPosition) {
    return _$setFlapsPositionAsyncAction
        .run(() => super.setFlapsPosition(newFlapsPosition));
  }

  late final _$setSpeedBrakePositionAsyncAction = AsyncAction(
      '_SystemsCommanderStore.setSpeedBrakePosition',
      context: context);

  @override
  Future<void> setSpeedBrakePosition(double newSpeedBrakePosition) {
    return _$setSpeedBrakePositionAsyncAction
        .run(() => super.setSpeedBrakePosition(newSpeedBrakePosition));
  }

  late final _$setParkingBrakePositionAsyncAction = AsyncAction(
      '_SystemsCommanderStore.setParkingBrakePosition',
      context: context);

  @override
  Future<void> setParkingBrakePosition(double newParkingBrakePosition) {
    return _$setParkingBrakePositionAsyncAction
        .run(() => super.setParkingBrakePosition(newParkingBrakePosition));
  }

  late final _$setAutoBrakePositionAsyncAction = AsyncAction(
      '_SystemsCommanderStore.setAutoBrakePosition',
      context: context);

  @override
  Future<void> setAutoBrakePosition(double newAutoBrakePosition) {
    return _$setAutoBrakePositionAsyncAction
        .run(() => super.setAutoBrakePosition(newAutoBrakePosition));
  }

  late final _$setThrottlePositionAsyncAction = AsyncAction(
      '_SystemsCommanderStore.setThrottlePosition',
      context: context);

  @override
  Future<void> setThrottlePosition(double newThrottlePosition) {
    return _$setThrottlePositionAsyncAction
        .run(() => super.setThrottlePosition(newThrottlePosition));
  }

  late final _$setReversePositionAsyncAction = AsyncAction(
      '_SystemsCommanderStore.setReversePosition',
      context: context);

  @override
  Future<void> setReversePosition(double newReversePosition) {
    return _$setReversePositionAsyncAction
        .run(() => super.setReversePosition(newReversePosition));
  }

  @override
  String toString() {
    return '''
gearPosition: ${gearPosition},
flapsPosition: ${flapsPosition},
speedBrakePosition: ${speedBrakePosition},
parkingBrakePosition: ${parkingBrakePosition},
throttlePosition: ${throttlePosition},
reversePosition: ${reversePosition},
autoBrakePosition: ${autoBrakePosition}
    ''';
  }
}
