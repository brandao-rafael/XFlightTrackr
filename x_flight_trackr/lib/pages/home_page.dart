import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:x_flight_trackr/pages/trackr_map_page.dart';
import 'package:x_flight_trackr/store/flight_plan_store.dart';
import 'package:x_flight_trackr/services/udp_utils.dart';
import 'package:x_flight_trackr/services/xplane_data_parser.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final FlightPlanStore _flightPlanStore = FlightPlanStore();

  void _init(Datagram datagram) {
    var xpc = XPlaneDataParser(datagram.data);
    List<double> parsedData;
    parsedData = xpc.parseDATA();
    _flightPlanStore.setXPlaneData(parsedData);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Stream<Datagram>>(
      future: UdpUtils.bindUdp(),
      builder: _buildHomePage,
    );
  }

  Widget _buildHomePage(
      BuildContext context, AsyncSnapshot<Stream<Datagram>> snapshot) {
    if (snapshot.hasError) {
      return Center(child: Text('Error: ${snapshot.error}'));
    }
    if (!snapshot.hasData) {
      return const Center(child: CircularProgressIndicator());
    }
    snapshot.data!.listen(_init);
    return Observer(builder: (_) {
      List<double> data = _flightPlanStore.xPlaneData;
      double lat = data.isNotEmpty ? data[171] : 0.0;
      double lng = data.isNotEmpty ? data[172] : 0.0;
      double mag = data.isNotEmpty ? data[147] : 0.0;
      return TrackrMapPage(
        lat: lat,
        lng: lng,
        mag: mag,
        flightPlanStore: _flightPlanStore,
      );
    });
  }
}
