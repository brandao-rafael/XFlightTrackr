import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class TrackrMapPage extends StatelessWidget {
  const TrackrMapPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Trackr Map'),
        ),
        body: GoogleMap(
            initialCameraPosition: const CameraPosition(
              target: LatLng(-22.42556, -45.45278),
            ),
            markers: {
              const Marker(
                markerId: MarkerId('1'),
                position: LatLng(-22.42556, -45.45278),
              ),
            }));
  }
}
