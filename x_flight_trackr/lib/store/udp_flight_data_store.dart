import 'package:mobx/mobx.dart';
import 'package:x_flight_trackr/services/udp_utils.dart';
import 'package:x_flight_trackr/services/xplane_data_parser.dart';

part 'udp_flight_data_store.g.dart';

class UdpFlightDataStore = _UdpFlightDataStoreBase with _$UdpFlightDataStore;

abstract class _UdpFlightDataStoreBase with Store {
  @observable
  List<double> xPlaneData = [];

  @action
  void setXPlaneData(List<double> data) {
    xPlaneData = data;
  }

  // Initialize the UDP connection and listen to incoming datagrams
  void initializeUdpListener() async {
    var udpStream = await UdpUtils.bindUdp();
    udpStream.listen((datagram) {
      var xpc = XPlaneDataParser(datagram.data);
      setXPlaneData(xpc.parseDATA());
    });
  }
}
