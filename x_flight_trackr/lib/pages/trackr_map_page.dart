import 'dart:typed_data';
import 'package:flutter/services.dart' show rootBundle;
import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:x_flight_trackr/components/flight_data.dart';

class TrackrMapPage extends StatefulWidget {
  final double lat;
  final double lng;
  final double mag;
  final List<double> data;

  const TrackrMapPage({
    super.key,
    required this.lat,
    required this.lng,
    required this.mag,
    required this.data,
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
        title: const Text('XTrackr Map'),
        centerTitle: true,
      ),
      body: Stack(
        children: [
          GoogleMap(
            zoomControlsEnabled: false,
            initialCameraPosition: CameraPosition(
              target: LatLng(widget.lat, widget.lng),
            ),
            markers: {
              Marker(
                markerId: const MarkerId('1'),
                position: LatLng(widget.lat, widget.lng),
                rotation: widget.mag - 90,
                icon: customMarker != null && customMarker!.isNotEmpty
                    ? BitmapDescriptor.fromBytes(customMarker!)
                    : BitmapDescriptor.defaultMarker,
              ),
            },
          ),
          if (widget.data.isNotEmpty)
            FlightData(data: widget.data)
          else
            Positioned(
              bottom: 0,
              child: Container(
                  color: const Color.fromRGBO(255, 255, 255, 0.498),
                  padding: const EdgeInsets.all(8.0),
                  height: 100,
                  width: MediaQuery.of(context).size.width,
                  child: const Text('No data available')),
            )
        ],
      ),
    );
  }
}
