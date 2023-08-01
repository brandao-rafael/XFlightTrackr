import 'dart:io';

import 'package:flutter/material.dart';
import 'package:x_flight_trackr/pages/trackr_map_page.dart';
import 'package:x_flight_trackr/utils/udp_utils.dart';
import 'package:x_flight_trackr/utils/xplane_data_parser.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<double> _allData = [];

  void _init(Datagram datagram) {
    var xpc = XPlaneDataParser(datagram.data);
    List<double> parsedData;
    parsedData = xpc.parseDATA();
    setState(() {
      _allData = parsedData;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'XFlightTrackr',
      debugShowCheckedModeBanner: false,
      theme: _buildThemeData(),
      home: FutureBuilder<Stream<Datagram>>(
        future: UdpUtils.bindUdp(),
        builder: _buildHomePage,
      ),
    );
  }

  ThemeData _buildThemeData() {
    return ThemeData(
      colorScheme: ColorScheme.fromSeed(seedColor: Colors.blueAccent[700]!),
      useMaterial3: true,
      textButtonTheme: TextButtonThemeData(
        style: ButtonStyle(
          foregroundColor: MaterialStateProperty.all(Colors.blueAccent[700]),
        ),
      ),
      appBarTheme: AppBarTheme(
        backgroundColor: Colors.blueAccent[700] ?? Colors.blueAccent,
        foregroundColor: Colors.white,
      ),
      textTheme: const TextTheme(
        bodyLarge: TextStyle(color: Colors.white),
        bodyMedium: TextStyle(color: Colors.white),
        bodySmall: TextStyle(color: Colors.white),
      ),
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
    return TrackrMapPage(
      lat: _allData.isNotEmpty ? _allData[171] : 0.0,
      lng: _allData.isNotEmpty ? _allData[172] : 0.0,
      mag: _allData.isNotEmpty ? _allData[147] : 0.0,
      data: _allData,
    );
  }
}
