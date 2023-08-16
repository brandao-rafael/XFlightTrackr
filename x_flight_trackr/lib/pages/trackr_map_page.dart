import 'dart:io';
import 'dart:typed_data';
import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_polyline_algorithm/google_polyline_algorithm.dart';

import 'package:x_flight_trackr/components/flight_data.dart';
import 'package:x_flight_trackr/components/flight_plan_details.dart';
import 'package:x_flight_trackr/components/search_flight_plan.dart';
import 'package:x_flight_trackr/components/select_map_type.dart';
import 'package:x_flight_trackr/store/flight_plan_store.dart';

class TrackrMapPage extends StatefulWidget {
  final double lat;
  final double lng;
  final double mag;
  final FlightPlanStore flightPlanStore;

  const TrackrMapPage({
    Key? key,
    required this.lat,
    required this.lng,
    required this.mag,
    required this.flightPlanStore,
  }) : super(key: key);
  @override
  _TrackrMapPageState createState() => _TrackrMapPageState();
}

class _TrackrMapPageState extends State<TrackrMapPage> {
  Uint8List? _customMarker;
  MapType _currentMapType = MapType.terrain;
  String _ip = 'Searching for ip...';

  @override
  void initState() {
    super.initState();
    _viewIps();
    _loadCustomMarker();
  }

  Future<void> _loadCustomMarker() async {
    final value = await getBytesFromAsset();
    setState(() {
      _customMarker = value;
    });
  }

  List<LatLng> convertPoints(List<List<num>> points) => points
      .map((point) => LatLng(point[0].toDouble(), point[1].toDouble()))
      .toList();

  List<LatLng> decodePolylines(String polyline) {
    final polylinePoints = decodePolyline(polyline);
    return convertPoints(polylinePoints);
  }

  Future<Uint8List?> getBytesFromAsset() async {
    final data = await rootBundle.load('lib/assets/icons/airplane_icon.png');
    final codec = await ui.instantiateImageCodec(data.buffer.asUint8List(),
        targetWidth: 128);
    final fi = await codec.getNextFrame();
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
      appBar: _buildAppBar(),
      body: Stack(
        children: [
          _buildGoogleMap(widget.flightPlanStore),
          _buildOverlays(widget.flightPlanStore),
          _buildFlightDataOrEmptyState(),
        ],
      ),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      title: const Text('XFlight Trackr'),
      centerTitle: true,
    );
  }

  GoogleMap _buildGoogleMap(FlightPlanStore flightPlanStore) {
    return GoogleMap(
      mapType: _currentMapType,
      zoomControlsEnabled: false,
      initialCameraPosition: CameraPosition(
        target: LatLng(widget.lat, widget.lng),
      ),
      rotateGesturesEnabled: false,
      markers: _buildMarkers(),
      polylines: _buildPolylines(flightPlanStore),
    );
  }

  Set<Marker> _buildMarkers() {
    return {
      Marker(
        markerId: const MarkerId('1'),
        position: LatLng(widget.lat, widget.lng),
        rotation: widget.mag - 90,
        icon: _customMarker != null && _customMarker!.isNotEmpty
            ? BitmapDescriptor.fromBytes(_customMarker!)
            : BitmapDescriptor.defaultMarker,
      ),
    };
  }

  Set<Polyline> _buildPolylines(FlightPlanStore flightPlanStore) {
    if (flightPlanStore.selectedFlightPlan['encodedPolyline'] != null) {
      return {
        Polyline(
          polylineId: const PolylineId('1'),
          color: Colors.red,
          width: 3,
          points: decodePolylines(
              flightPlanStore.selectedFlightPlan['encodedPolyline']),
          geodesic: true,
          jointType: JointType.round,
        ),
      };
    }
    return {};
  }

  Column _buildOverlays(FlightPlanStore flightPlanStore) {
    return Column(
      children: [
        SelectMapType(setMapType: _setMapType),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            SearchFlightPlan(store: flightPlanStore),
            FlightPlanDetails(
                selectedFlightPlan: flightPlanStore.selectedFlightPlan),
          ],
        ),
      ],
    );
  }

  Widget _buildFlightDataOrEmptyState() {
    return widget.flightPlanStore.xPlaneData.isNotEmpty
        ? FlightData(data: widget.flightPlanStore.xPlaneData)
        : Positioned(
            bottom: 0,
            child: _buildEmptyStateContainer(),
          );
  }

  Future<void> _viewIps() async {
    for (var interface in await NetworkInterface.list()) {
      if (interface.name.contains('wlan')) {
        setState(() {
          _ip = interface.addresses.map((addr) => addr.address).toList()[0];
        });
        return;
      }
      setState(() {
        _ip = 'Ip not found';
      });
    }
  }

  Container _buildEmptyStateContainer() {
    return Container(
      color: const ui.Color.fromARGB(125, 7, 7, 7),
      padding: const EdgeInsets.all(8.0),
      height: 150,
      width: MediaQuery.of(context).size.width,
      child: Text(
          "Data is currently unavailable. If you are in flight, please verify the Windows Defender rules for X-Plane and confirm that the correct ip and port is being used. Your mobile ip is $_ip. Within X-Plane, the data output should be set to UDP and the port should be configured to 51000."),
    );
  }
}
