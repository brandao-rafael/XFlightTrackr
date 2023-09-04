// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'efis_commander_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$EFISCommanderStore on _EFISCommanderStore, Store {
  late final _$mapRangeAtom =
      Atom(name: '_EFISCommanderStore.mapRange', context: context);

  @override
  double get mapRange {
    _$mapRangeAtom.reportRead();
    return super.mapRange;
  }

  @override
  set mapRange(double value) {
    _$mapRangeAtom.reportWrite(value, super.mapRange, () {
      super.mapRange = value;
    });
  }

  late final _$subModeAtom =
      Atom(name: '_EFISCommanderStore.subMode', context: context);

  @override
  EFISMapMode get subMode {
    _$subModeAtom.reportRead();
    return super.subMode;
  }

  @override
  set subMode(EFISMapMode value) {
    _$subModeAtom.reportWrite(value, super.subMode, () {
      super.subMode = value;
    });
  }

  late final _$mapModeAtom =
      Atom(name: '_EFISCommanderStore.mapMode', context: context);

  @override
  EFISMapMode get mapMode {
    _$mapModeAtom.reportRead();
    return super.mapMode;
  }

  @override
  set mapMode(EFISMapMode value) {
    _$mapModeAtom.reportWrite(value, super.mapMode, () {
      super.mapMode = value;
    });
  }

  late final _$showAirportsAtom =
      Atom(name: '_EFISCommanderStore.showAirports', context: context);

  @override
  bool get showAirports {
    _$showAirportsAtom.reportRead();
    return super.showAirports;
  }

  @override
  set showAirports(bool value) {
    _$showAirportsAtom.reportWrite(value, super.showAirports, () {
      super.showAirports = value;
    });
  }

  late final _$showVORsAtom =
      Atom(name: '_EFISCommanderStore.showVORs', context: context);

  @override
  bool get showVORs {
    _$showVORsAtom.reportRead();
    return super.showVORs;
  }

  @override
  set showVORs(bool value) {
    _$showVORsAtom.reportWrite(value, super.showVORs, () {
      super.showVORs = value;
    });
  }

  late final _$showNDBsAtom =
      Atom(name: '_EFISCommanderStore.showNDBs', context: context);

  @override
  bool get showNDBs {
    _$showNDBsAtom.reportRead();
    return super.showNDBs;
  }

  @override
  set showNDBs(bool value) {
    _$showNDBsAtom.reportWrite(value, super.showNDBs, () {
      super.showNDBs = value;
    });
  }

  late final _$showTcasAtom =
      Atom(name: '_EFISCommanderStore.showTcas', context: context);

  @override
  bool get showTcas {
    _$showTcasAtom.reportRead();
    return super.showTcas;
  }

  @override
  set showTcas(bool value) {
    _$showTcasAtom.reportWrite(value, super.showTcas, () {
      super.showTcas = value;
    });
  }

  late final _$showWaypointsAtom =
      Atom(name: '_EFISCommanderStore.showWaypoints', context: context);

  @override
  bool get showWaypoints {
    _$showWaypointsAtom.reportRead();
    return super.showWaypoints;
  }

  @override
  set showWaypoints(bool value) {
    _$showWaypointsAtom.reportWrite(value, super.showWaypoints, () {
      super.showWaypoints = value;
    });
  }

  late final _$showWeatherAtom =
      Atom(name: '_EFISCommanderStore.showWeather', context: context);

  @override
  bool get showWeather {
    _$showWeatherAtom.reportRead();
    return super.showWeather;
  }

  @override
  set showWeather(bool value) {
    _$showWeatherAtom.reportWrite(value, super.showWeather, () {
      super.showWeather = value;
    });
  }

  late final _$weatherAlphaAtom =
      Atom(name: '_EFISCommanderStore.weatherAlpha', context: context);

  @override
  double get weatherAlpha {
    _$weatherAlphaAtom.reportRead();
    return super.weatherAlpha;
  }

  @override
  set weatherAlpha(double value) {
    _$weatherAlphaAtom.reportWrite(value, super.weatherAlpha, () {
      super.weatherAlpha = value;
    });
  }

  late final _$ecamModeAtom =
      Atom(name: '_EFISCommanderStore.ecamMode', context: context);

  @override
  ECAMMode get ecamMode {
    _$ecamModeAtom.reportRead();
    return super.ecamMode;
  }

  @override
  set ecamMode(ECAMMode value) {
    _$ecamModeAtom.reportWrite(value, super.ecamMode, () {
      super.ecamMode = value;
    });
  }

  late final _$setMapRangeAsyncAction =
      AsyncAction('_EFISCommanderStore.setMapRange', context: context);

  @override
  Future<void> setMapRange(double newMapRange) {
    return _$setMapRangeAsyncAction.run(() => super.setMapRange(newMapRange));
  }

  late final _$setSubModeAsyncAction =
      AsyncAction('_EFISCommanderStore.setSubMode', context: context);

  @override
  Future<void> setSubMode(EFISMapMode newSubMode) {
    return _$setSubModeAsyncAction.run(() => super.setSubMode(newSubMode));
  }

  late final _$setMapModeAsyncAction =
      AsyncAction('_EFISCommanderStore.setMapMode', context: context);

  @override
  Future<void> setMapMode(EFISMapMode newMapMode) {
    return _$setMapModeAsyncAction.run(() => super.setMapMode(newMapMode));
  }

  late final _$setShowAirportsAsyncAction =
      AsyncAction('_EFISCommanderStore.setShowAirports', context: context);

  @override
  Future<void> setShowAirports(bool newShowAirports) {
    return _$setShowAirportsAsyncAction
        .run(() => super.setShowAirports(newShowAirports));
  }

  late final _$setShowVORsAsyncAction =
      AsyncAction('_EFISCommanderStore.setShowVORs', context: context);

  @override
  Future<void> setShowVORs(bool newShowVORs) {
    return _$setShowVORsAsyncAction.run(() => super.setShowVORs(newShowVORs));
  }

  late final _$setShowNDBsAsyncAction =
      AsyncAction('_EFISCommanderStore.setShowNDBs', context: context);

  @override
  Future<void> setShowNDBs(bool newShowNDBs) {
    return _$setShowNDBsAsyncAction.run(() => super.setShowNDBs(newShowNDBs));
  }

  late final _$setShowTcasAsyncAction =
      AsyncAction('_EFISCommanderStore.setShowTcas', context: context);

  @override
  Future<void> setShowTcas(bool newShowTcas) {
    return _$setShowTcasAsyncAction.run(() => super.setShowTcas(newShowTcas));
  }

  late final _$setShowWaypointsAsyncAction =
      AsyncAction('_EFISCommanderStore.setShowWaypoints', context: context);

  @override
  Future<void> setShowWaypoints(bool newShowWaypoints) {
    return _$setShowWaypointsAsyncAction
        .run(() => super.setShowWaypoints(newShowWaypoints));
  }

  late final _$setShowWeatherAsyncAction =
      AsyncAction('_EFISCommanderStore.setShowWeather', context: context);

  @override
  Future<void> setShowWeather(bool newShowWeather) {
    return _$setShowWeatherAsyncAction
        .run(() => super.setShowWeather(newShowWeather));
  }

  late final _$setWeatherAlphaAsyncAction =
      AsyncAction('_EFISCommanderStore.setWeatherAlpha', context: context);

  @override
  Future<void> setWeatherAlpha(double newWeatherAlpha) {
    return _$setWeatherAlphaAsyncAction
        .run(() => super.setWeatherAlpha(newWeatherAlpha));
  }

  late final _$setECAMModeAsyncAction =
      AsyncAction('_EFISCommanderStore.setECAMMode', context: context);

  @override
  Future<void> setECAMMode(ECAMMode newECAMMode) {
    return _$setECAMModeAsyncAction.run(() => super.setECAMMode(newECAMMode));
  }

  @override
  String toString() {
    return '''
mapRange: ${mapRange},
subMode: ${subMode},
mapMode: ${mapMode},
showAirports: ${showAirports},
showVORs: ${showVORs},
showNDBs: ${showNDBs},
showTcas: ${showTcas},
showWaypoints: ${showWaypoints},
showWeather: ${showWeather},
weatherAlpha: ${weatherAlpha},
ecamMode: ${ecamMode}
    ''';
  }
}
