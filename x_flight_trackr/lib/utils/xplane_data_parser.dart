import 'dart:typed_data';

class XPlaneDataParser {
  List<int> data;

  XPlaneDataParser(this.data);

  String parseASCIIString(int start, int length) {
    return String.fromCharCodes(data.sublist(start, start + length));
  }

  double parse32BitFloat(int start) {
    final byteData = ByteData.view(
        Uint8List.fromList(data.sublist(start, start + 4)).buffer);
    return byteData.getFloat32(0, Endian.little);
  }

  double parse64BitFloat(int start) {
    final byteData = ByteData.view(
        Uint8List.fromList(data.sublist(start, start + 8)).buffer);
    return byteData.getFloat64(0, Endian.little);
  }

  List<dynamic> parseDATA() {
    List<dynamic> parsedData = [];

    if (parseASCIIString(0, 4) == 'DATA') {
      // parsedData['dataRowIndex'] = parse32BitInt(5);
      List<double> values = [];
      for (int i = 0; i < (data.length - 9) ~/ 4; i++) {
        values.add(parse32BitFloat(9 + i * 4));
      }
      parsedData = values;
    }

    return [...parsedData];
  }

  int parse32BitInt(int start) {
    final byteData = ByteData.view(
        Uint8List.fromList(data.sublist(start, start + 4)).buffer);
    return byteData.getInt32(0, Endian.little);
  }
}
