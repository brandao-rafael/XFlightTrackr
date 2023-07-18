import 'dart:typed_data';
import 'package:flutter/services.dart' show rootBundle;
import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:x_flight_trackr/models/trackr_location.dart';

class TrackrMapPage extends StatefulWidget {
  final double lat;
  final double lng;
  final double mag;

  TrackrMapPage({
    super.key,
    required this.lat,
    required this.lng,
    required this.mag,
  });

  @override
  State<TrackrMapPage> createState() => _TrackrMapPageState();
}

class _TrackrMapPageState extends State<TrackrMapPage> {
  Uint8List? customMarker;

  Future<Uint8List?> getBytesFromAsset() async {
    ByteData data = await rootBundle.load('lib/assets/icons/airplane_icon.png');
    ui.Codec codec = await ui.instantiateImageCodec(data.buffer.asUint8List(),
        targetWidth: 128);
    ui.FrameInfo fi = await codec.getNextFrame();
    return (await fi.image.toByteData(format: ui.ImageByteFormat.png))
        ?.buffer
        .asUint8List();
  }

  @override
  void initState() {
    super.initState();
    getBytesFromAsset().then((value) {
      setState(() {
        customMarker = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Trackr Map'),
      ),
      body: GoogleMap(
        initialCameraPosition: CameraPosition(
          target: LatLng(widget.lat, widget.lng),
        ),
        markers: {
          Marker(
            markerId: const MarkerId('1'),
            position: LatLng(widget.lat, widget.lng),
            rotation: widget.mag - 90,
            icon: customMarker!.isNotEmpty
                ? BitmapDescriptor.fromBytes(customMarker!)
                : BitmapDescriptor.defaultMarker,
          ),
        },
      ),
    );
  }
}
