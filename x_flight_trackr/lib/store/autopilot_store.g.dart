// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'autopilot_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$AutopilotStore on _AutopilotStore, Store {
  late final _$modeAtom = Atom(name: '_AutopilotStore.mode', context: context);

  @override
  AutoPilotMode get mode {
    _$modeAtom.reportRead();
    return super.mode;
  }

  @override
  set mode(AutoPilotMode value) {
    _$modeAtom.reportWrite(value, super.mode, () {
      super.mode = value;
    });
  }

  late final _$bankAngleAtom =
      Atom(name: '_AutopilotStore.bankAngle', context: context);

  @override
  AutoPilotBankAngle get bankAngle {
    _$bankAngleAtom.reportRead();
    return super.bankAngle;
  }

  @override
  set bankAngle(AutoPilotBankAngle value) {
    _$bankAngleAtom.reportWrite(value, super.bankAngle, () {
      super.bankAngle = value;
    });
  }

  late final _$altitudeModeAtom =
      Atom(name: '_AutopilotStore.altitudeMode', context: context);

  @override
  AutoPilotAltitudeMode get altitudeMode {
    _$altitudeModeAtom.reportRead();
    return super.altitudeMode;
  }

  @override
  set altitudeMode(AutoPilotAltitudeMode value) {
    _$altitudeModeAtom.reportWrite(value, super.altitudeMode, () {
      super.altitudeMode = value;
    });
  }

  late final _$headingModeAtom =
      Atom(name: '_AutopilotStore.headingMode', context: context);

  @override
  AutoPilotHeadingMode get headingMode {
    _$headingModeAtom.reportRead();
    return super.headingMode;
  }

  @override
  set headingMode(AutoPilotHeadingMode value) {
    _$headingModeAtom.reportWrite(value, super.headingMode, () {
      super.headingMode = value;
    });
  }

  late final _$altitudeAtom =
      Atom(name: '_AutopilotStore.altitude', context: context);

  @override
  double get altitude {
    _$altitudeAtom.reportRead();
    return super.altitude;
  }

  @override
  set altitude(double value) {
    _$altitudeAtom.reportWrite(value, super.altitude, () {
      super.altitude = value;
    });
  }

  late final _$headingAtom =
      Atom(name: '_AutopilotStore.heading', context: context);

  @override
  double get heading {
    _$headingAtom.reportRead();
    return super.heading;
  }

  @override
  set heading(double value) {
    _$headingAtom.reportWrite(value, super.heading, () {
      super.heading = value;
    });
  }

  late final _$verticalSpeedAtom =
      Atom(name: '_AutopilotStore.verticalSpeed', context: context);

  @override
  double get verticalSpeed {
    _$verticalSpeedAtom.reportRead();
    return super.verticalSpeed;
  }

  @override
  set verticalSpeed(double value) {
    _$verticalSpeedAtom.reportWrite(value, super.verticalSpeed, () {
      super.verticalSpeed = value;
    });
  }

  late final _$airspeedAtom =
      Atom(name: '_AutopilotStore.airspeed', context: context);

  @override
  double get airspeed {
    _$airspeedAtom.reportRead();
    return super.airspeed;
  }

  @override
  set airspeed(double value) {
    _$airspeedAtom.reportWrite(value, super.airspeed, () {
      super.airspeed = value;
    });
  }

  late final _$autoThrottleAtom =
      Atom(name: '_AutopilotStore.autoThrottle', context: context);

  @override
  bool get autoThrottle {
    _$autoThrottleAtom.reportRead();
    return super.autoThrottle;
  }

  @override
  set autoThrottle(bool value) {
    _$autoThrottleAtom.reportWrite(value, super.autoThrottle, () {
      super.autoThrottle = value;
    });
  }

  late final _$setModeAsyncAction =
      AsyncAction('_AutopilotStore.setMode', context: context);

  @override
  Future<void> setMode(AutoPilotMode newMode) {
    return _$setModeAsyncAction.run(() => super.setMode(newMode));
  }

  late final _$setBankAngleAsyncAction =
      AsyncAction('_AutopilotStore.setBankAngle', context: context);

  @override
  Future<void> setBankAngle(AutoPilotBankAngle newBankAngle) {
    return _$setBankAngleAsyncAction
        .run(() => super.setBankAngle(newBankAngle));
  }

  late final _$setAltitudeModeAsyncAction =
      AsyncAction('_AutopilotStore.setAltitudeMode', context: context);

  @override
  Future<void> setAltitudeMode(AutoPilotAltitudeMode newAltitudeMode) {
    return _$setAltitudeModeAsyncAction
        .run(() => super.setAltitudeMode(newAltitudeMode));
  }

  late final _$setHeadingModeAsyncAction =
      AsyncAction('_AutopilotStore.setHeadingMode', context: context);

  @override
  Future<void> setHeadingMode(AutoPilotHeadingMode newHeadingMode) {
    return _$setHeadingModeAsyncAction
        .run(() => super.setHeadingMode(newHeadingMode));
  }

  late final _$setAltitudeAsyncAction =
      AsyncAction('_AutopilotStore.setAltitude', context: context);

  @override
  Future<void> setAltitude(double newAltitude) {
    return _$setAltitudeAsyncAction.run(() => super.setAltitude(newAltitude));
  }

  late final _$setHeadingAsyncAction =
      AsyncAction('_AutopilotStore.setHeading', context: context);

  @override
  Future<void> setHeading(double newHeading) {
    return _$setHeadingAsyncAction.run(() => super.setHeading(newHeading));
  }

  late final _$setVerticalSpeedAsyncAction =
      AsyncAction('_AutopilotStore.setVerticalSpeed', context: context);

  @override
  Future<void> setVerticalSpeed(double newVerticalSpeed) {
    return _$setVerticalSpeedAsyncAction
        .run(() => super.setVerticalSpeed(newVerticalSpeed));
  }

  late final _$setAirspeedAsyncAction =
      AsyncAction('_AutopilotStore.setAirspeed', context: context);

  @override
  Future<void> setAirspeed(double newAirspeed) {
    return _$setAirspeedAsyncAction.run(() => super.setAirspeed(newAirspeed));
  }

  late final _$setAutoThrottleAsyncAction =
      AsyncAction('_AutopilotStore.setAutoThrottle', context: context);

  @override
  Future<void> setAutoThrottle(bool newAutoThrottle) {
    return _$setAutoThrottleAsyncAction
        .run(() => super.setAutoThrottle(newAutoThrottle));
  }

  @override
  String toString() {
    return '''
mode: ${mode},
bankAngle: ${bankAngle},
altitudeMode: ${altitudeMode},
headingMode: ${headingMode},
altitude: ${altitude},
heading: ${heading},
verticalSpeed: ${verticalSpeed},
airspeed: ${airspeed},
autoThrottle: ${autoThrottle}
    ''';
  }
}
