import 'package:google_maps_flutter/google_maps_flutter.dart';

class TrackrLocation {
  final double latitude;
  final double longitude;

  const TrackrLocation({
    required this.latitude,
    required this.longitude,
  });

  LatLng toLatLng() {
    return LatLng(latitude, longitude);
  }
}
