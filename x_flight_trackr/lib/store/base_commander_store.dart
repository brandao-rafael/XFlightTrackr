import 'package:x_flight_trackr/services/commanders/x_plane_commander.dart';

abstract class BaseCommanderStore {
  final XPlaneCommander command =
      XPlaneCommander(xplaneAddress: '192.168.50.157', xplanePort: 49000);

  BaseCommanderStore();
}
