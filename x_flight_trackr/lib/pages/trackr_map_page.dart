import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:x_flight_trackr/utils/location_util.dart';

class TrackrMapPage extends StatelessWidget {
  const TrackrMapPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Trackr Map'),
        ),
        body: const GoogleMap(
          initialCameraPosition: CameraPosition(
            target: LatLng(-22.42556, -45.45278),
          ),
        ));
  }
}
