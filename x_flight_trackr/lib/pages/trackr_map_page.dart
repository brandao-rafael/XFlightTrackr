import 'dart:typed_data';
import 'dart:ui' as ui;
import 'package:flutter/services.dart' show rootBundle;
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:x_flight_trackr/components/flight_data.dart';
import 'package:x_flight_trackr/components/select_map_type.dart';

class TrackrMapPage extends StatefulWidget {
  final double lat;
  final double lng;
  final double mag;
  final List<double> data;

  const TrackrMapPage({
    Key? key,
    required this.lat,
    required this.lng,
    required this.mag,
    required this.data,
  }) : super(key: key);

  @override
  State<TrackrMapPage> createState() => _TrackrMapPageState();
}

class _TrackrMapPageState extends State<TrackrMapPage> {
  Uint8List? _customMarker;
  MapType _currentMapType = MapType.terrain;

  @override
  void initState() {
    super.initState();
    getBytesFromAsset().then((value) {
      setState(() {
        _customMarker = value;
      });
    });
  }

  Future<Uint8List?> getBytesFromAsset() async {
    ByteData data = await rootBundle.load('lib/assets/icons/airplane_icon.png');
    ui.Codec codec = await ui.instantiateImageCodec(data.buffer.asUint8List(),
        targetWidth: 128);
    ui.FrameInfo fi = await codec.getNextFrame();
    return (await fi.image.toByteData(format: ui.ImageByteFormat.png))
        ?.buffer
        .asUint8List();
  }

  void _setMapType(MapType type) {
    setState(() {
      _currentMapType = type;
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
            mapType: _currentMapType,
            zoomControlsEnabled: false,
            initialCameraPosition: CameraPosition(
              target: LatLng(widget.lat, widget.lng),
            ),
            markers: {
              Marker(
                markerId: const MarkerId('1'),
                position: LatLng(widget.lat, widget.lng),
                rotation: widget.mag - 90,
                icon: _customMarker != null && _customMarker!.isNotEmpty
                    ? BitmapDescriptor.fromBytes(_customMarker!)
                    : BitmapDescriptor.defaultMarker,
              ),
            },
          ),
          SelectMapType(setMapType: _setMapType),
          _buildFlightDataOrEmptyState(),
        ],
      ),
    );
  }

  Widget _buildFlightDataOrEmptyState() {
    return widget.data.isNotEmpty
        ? FlightData(data: widget.data)
        : Positioned(
            bottom: 0,
            child: Container(
              color: const ui.Color.fromARGB(125, 7, 7, 7),
              padding: const EdgeInsets.all(8.0),
              height: 150,
              width: MediaQuery.of(context).size.width,
              child: const Text(
                  "Data is currently unavailable. If you are in flight, please verify the Windows Defender rules for X-Plane and confirm that the correct port is being used. Within X-Plane, the data output should be set to UDP and the port should be configured to 51000."),
            ),
          );
  }
}
