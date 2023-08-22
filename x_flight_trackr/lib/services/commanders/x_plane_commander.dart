import 'dart:convert';
import 'dart:typed_data';
import 'package:udp/udp.dart';
import 'dart:io';

class XPlaneCommander {
  final String xplaneAddress;
  final int xplanePort;

  XPlaneCommander({required this.xplaneAddress, required this.xplanePort});

  Future<void> sendDref(String dref, double value) async {
    var udp = await UDP.bind(Endpoint.any());

    // Create the message
    var message = Uint8List(509); // 5 + 4 + 500 bytes
    var buffer = ByteData.sublistView(message);

    // Set the "DREF0" header
    buffer.setUint8(0, 'D'.codeUnitAt(0));
    buffer.setUint8(1, 'R'.codeUnitAt(0));
    buffer.setUint8(2, 'E'.codeUnitAt(0));
    buffer.setUint8(3, 'F'.codeUnitAt(0));
    buffer.setUint8(4, '0'.codeUnitAt(0));

    // Set the float value
    buffer.setFloat32(5, value, Endian.little);

    // Set the dataref string
    var drefBytes = utf8.encode(dref);
    for (int i = 0; i < drefBytes.length; i++) {
      buffer.setUint8(9 + i, drefBytes[i]);
    }

    // Send the message
    await udp.send(
        message,
        Endpoint.unicast(InternetAddress(xplaneAddress),
            port: Port(xplanePort)));
  }
}
