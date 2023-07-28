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

  String decimalHoursToHoursAndMinutes(double decimalHours) {
    int hours = decimalHours.toInt();
    int minutes = ((decimalHours - hours) * 60).round();

    return '$hours:$minutes';
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
            zoomControlsEnabled: false,
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
          if (widget.data.isNotEmpty)
            Positioned(
              bottom: 0,
              child: Container(
                  color: const ui.Color.fromARGB(125, 0, 0, 0),
                  padding: const EdgeInsets.all(8.0),
                  height: 100,
                  width: MediaQuery.of(context).size.width,
                  child: Column(
                    children: [
                      Text(decimalHoursToHoursAndMinutes(widget.data[6])),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              const Text(
                                'Airspeed',
                              ),
                              Text(
                                '${widget.data[9].toStringAsFixed(0)} kt',
                              ),
                              Text(
                                '.mach: ${widget.data[18].toStringAsFixed(2)}',
                              ),
                            ],
                          ),
                          Container(
                            width: 1,
                            height: 50,
                            color: Colors.white,
                            margin: const EdgeInsets.symmetric(horizontal: 8.0),
                          ),
                          Column(
                            children: [
                              const Text(
                                'Heading',
                                textAlign: TextAlign.center,
                              ),
                              Text('${widget.data[57].toStringAsFixed(0)}°'),
                            ],
                          ),
                          Container(
                            width: 1,
                            height: 50,
                            color: Colors.white,
                            margin: const EdgeInsets.symmetric(horizontal: 8.0),
                          ),
                          Column(
                            children: [
                              const Text(
                                'Altitude',
                                textAlign: TextAlign.center,
                              ),
                              Text(
                                  '${(widget.data[77]).toStringAsFixed(0)} ft'),
                            ],
                          )
                        ],
                      ),
                    ],
                  )),
            )
          else
            Positioned(
              bottom: 0,
              child: Container(
                  color: const Color.fromRGBO(255, 255, 255, 0.498),
                  padding: const EdgeInsets.all(8.0),
                  height: 100,
                  width: MediaQuery.of(context).size.width,
                  child: const Column(
                    children: [
                      Text('Airspeed: 0 kias'),
                      Text('Altitude: 0 ft'),
                      Text('Heading: 0°')
                    ],
                  )),
            )
        ],
      ),
    );
  }
}
