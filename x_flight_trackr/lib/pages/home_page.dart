import 'dart:io';

import 'package:flutter/material.dart';
import 'package:x_flight_trackr/pages/trackr_map_page.dart';
import 'package:x_flight_trackr/utils/udp_utils.dart';
import 'package:x_flight_trackr/utils/xplane_data_parser.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<double> allData = [];

  void _init(Datagram datagram) {
    var xpc = XPlaneDataParser(datagram.data);
    List<double> parsedData;
    parsedData = xpc.parseDATA();
    setState(() {
      allData = parsedData;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FlightTrackr',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: FutureBuilder<Stream<Datagram>>(
        future: UdpUtils.bindUdp(),
        builder: (ctx, snapshot) {
          if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          }
          if (!snapshot.hasData) {
            return const Center(child: CircularProgressIndicator());
          }
          snapshot.data!.listen(_init);
          return TrackrMapPage(
            lat: allData.isNotEmpty ? allData[18] : 0.0,
            lng: allData.isNotEmpty ? allData[19] : 0.0,
            mag: allData.isNotEmpty ? allData[9] : 0.0,
            data: allData,
          );
        },
      ),
    );
  }
}
