import 'dart:typed_data';
import 'package:flutter/services.dart' show rootBundle;
import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

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
        title: const Text('Trackr Map'),
        centerTitle: true,
      ),
      body: Stack(
        children: [
          GoogleMap(
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
          Positioned(
            top: 0,
            child: Container(
                color: const Color.fromRGBO(255, 255, 255, 0.498),
                padding: const EdgeInsets.all(8.0),
                height: 100,
                width: MediaQuery.of(context).size.width,
                child: Column(
                  children: [
                    Text('Airspeed: ${widget.data[0].toStringAsFixed(0)} kias'),
                    Text('Altitude: ${widget.data[23].toStringAsFixed(0)} ft'),
                    Text('Heading: ${widget.data[9].toStringAsFixed(0)}°')
                  ],
                )),
          )
        ],
      ),
    );
  }
}
