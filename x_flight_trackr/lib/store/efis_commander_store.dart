import 'package:mobx/mobx.dart';
import 'package:x_flight_trackr/store/base_commander_store.dart';
import 'package:x_flight_trackr/services/commanders/efis_commander.dart';

part 'efis_commander_store.g.dart';

class EFISCommanderStore = _EFISCommanderStore with _$EFISCommanderStore;

abstract class _EFISCommanderStore extends BaseCommanderStore with Store {
  late EFISCommander efisCommander;

  _EFISCommanderStore() : super() {
    efisCommander = EFISCommander(commander: command);
  }

  @observable
  double mapRange = 0;

  @observable
  EFISMapMode subMode = EFISMapMode.MAP;

  @observable
  EFISMapMode mapMode = EFISMapMode.MAP;

  @observable
  bool showAirports = false;

  @observable
  bool showVORs = false;

  @observable
  bool showNDBs = false;

  @observable
  bool showTcas = false;

  @observable
  bool showWaypoints = false;

  @observable
  bool showWeather = false;

  @observable
  double weatherAlpha = 1;

  @observable
  ECAMMode ecamMode = ECAMMode.ENGINE;

  @action
  Future<void> setMapRange(double newMapRange) async {
    try {
      mapRange = newMapRange;
      await efisCommander.setMapRange(mapRange);
    } catch (_) {
      mapRange = 0;
    }
  }

  @action
  Future<void> setSubMode(EFISMapMode newSubMode) async {
    try {
      subMode = newSubMode;
      await efisCommander.setSubmode(subMode);
    } catch (_) {
      subMode = EFISMapMode.MAP;
    }
  }

  @action
  Future<void> setMapMode(EFISMapMode newMapMode) async {
    try {
      mapMode = newMapMode;
      await efisCommander.setMapMode(mapMode);
    } catch (_) {
      mapMode = EFISMapMode.MAP;
    }
  }

  @action
  Future<void> setShowAirports(bool newShowAirports) async {
    try {
      showAirports = newShowAirports;
      await efisCommander.showAirport(showAirports);
    } catch (_) {
      showAirports = false;
    }
  }

  @action
  Future<void> setShowVORs(bool newShowVORs) async {
    try {
      showVORs = newShowVORs;
      await efisCommander.showVOR(showVORs);
    } catch (_) {
      showVORs = false;
    }
  }

  @action
  Future<void> setShowNDBs(bool newShowNDBs) async {
    try {
      showNDBs = newShowNDBs;
      await efisCommander.showNDB(showNDBs);
    } catch (_) {
      showNDBs = false;
    }
  }

  @action
  Future<void> setShowTcas(bool newShowTcas) async {
    try {
      showTcas = newShowTcas;
      await efisCommander.showTCAS(showTcas);
    } catch (_) {
      showTcas = false;
    }
  }

  @action
  Future<void> setShowWaypoints(bool newShowWaypoints) async {
    try {
      showWaypoints = newShowWaypoints;
      await efisCommander.showWaypoints(showWaypoints);
    } catch (_) {
      showWaypoints = false;
    }
  }

  @action
  Future<void> setShowWeather(bool newShowWeather) async {
    try {
      showWeather = newShowWeather;
      await efisCommander.showWeather(showWeather);
    } catch (_) {
      showWeather = false;
    }
  }

  @action
  Future<void> setWeatherAlpha(double newWeatherAlpha) async {
    try {
      weatherAlpha = newWeatherAlpha;
      await efisCommander.setWeatherAlpha(weatherAlpha);
    } catch (_) {
      weatherAlpha = 0;
    }
  }

  @action
  Future<void> setECAMMode(ECAMMode newECAMMode) async {
    try {
      ecamMode = newECAMMode;
      await efisCommander.setEcamMode(ecamMode);
    } catch (_) {
      ecamMode = ECAMMode.ENGINE;
    }
  }
}
