import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:x_flight_trackr/pages/trackr_map_page.dart';
import 'dart:async';

import 'package:x_flight_trackr/utils/udp_utils.dart';
import 'package:x_flight_trackr/utils/xplane_data_parser.dart';

// void main() async {
//   runApp(const MyApp());
//   await dotenv.load(fileName: ".env");
// }

void main() async {
  runApp(const MyApp());
  await dotenv.load(fileName: ".env");
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List<dynamic> allData = [];

  void _init(Datagram datagram) {
    var xpc = XPlaneDataParser(datagram.data);
    List<dynamic> parsedData;
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
            lat: allData.length > 20 ? allData[18] : 0.0,
            lng: allData.length > 20 ? allData[19] : 0.0,
            mag: allData.length > 20 ? allData[9] : 0.0,
          );
        },
      ),
    );
  }
}
