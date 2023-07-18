import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class TrackrMapPage extends StatelessWidget {
  final double lat;
  final double lng;

  const TrackrMapPage({
    super.key,
    required this.lat,
    required this.lng,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Trackr Map'),
        ),
        body: GoogleMap(
            initialCameraPosition: CameraPosition(
              target: LatLng(lat, lng),
            ),
            markers: {
              Marker(
                markerId: const MarkerId('1'),
                position: LatLng(lat, lng),
              ),
            }));
  }
}
