import 'package:x_flight_trackr/utils/commanders/x_plane_commander.dart';

enum EFISMapMode { APP, VOR, MAP, NAV, PLN }

enum ECAMMode { ENGINE, FUEL, CONTROLS, HYDRAULICS, FAILURE }

class EFISCommander {
  final XPlaneCommander commander;

  EFISCommander({required this.commander});

  Future<void> setMapRange(double range) async {
    return await commander.sendDref(
        'sim/cockpit/switches/EFIS_map_range_selector', range);
  }

  Future<void> setMapMode(EFISMapMode mode) {
    return commander.sendDref(
        'sim/cockpit2/EFIS/map_mode', mode.index.toDouble());
  }

  Future<void> setSubmode(EFISMapMode submode) async {
    return await commander.sendDref(
        'sim/cockpit/switches/EFIS_map_submode', submode.index.toDouble());
  }

  Future<void> showAirport(bool show) async {
    return await commander.sendDref(
        'sim/cockpit/switches/EFIS_shows_airports', show ? 1 : 0);
  }

  Future<void> showNDB(bool show) async {
    return await commander.sendDref(
        'sim/cockpit/switches/EFIS_shows_NDBs', show ? 1 : 0);
  }

  Future<void> showTCAS(bool show) async {
    return await commander.sendDref(
        'sim/cockpit/switches/EFIS_shows_tcas', show ? 1 : 0);
  }

  Future<void> showVOR(bool show) async {
    return await commander.sendDref(
        'sim/cockpit/switches/EFIS_shows_VORs', show ? 1 : 0);
  }

  Future<void> showWaypoints(bool show) async {
    return await commander.sendDref(
        'sim/cockpit/switches/EFIS_shows_waypoints', show ? 1 : 0);
  }

  Future<void> showWeather(bool show) async {
    return await commander.sendDref(
        'sim/cockpit/switches/EFIS_shows_weather', show ? 1 : 0);
  }

  // not work in 737-800
  Future<void> setEcamMode(ECAMMode mode) async {
    return await commander.sendDref(
        'sim/cockpit2/EFIS/ecam_mode', mode.index.toDouble());
  }

  Future<void> setWeatherAlpha(double alpha) async {
    return await commander.sendDref(
        'sim/cockpit/switches/EFIS_weather_alpha', alpha);
  }
}
