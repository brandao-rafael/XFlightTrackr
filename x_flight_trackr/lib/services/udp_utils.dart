import 'dart:io';

import 'package:udp/udp.dart';

abstract class UdpUtils {
  static Future<Stream<Datagram>> bindUdp() async {
    var receiver = await UDP.bind(Endpoint.any(port: const Port(51000)));
    return receiver.asStream() as Stream<Datagram>;
  }
}
