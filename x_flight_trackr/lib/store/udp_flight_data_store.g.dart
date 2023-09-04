// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'udp_flight_data_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$UdpFlightDataStore on _UdpFlightDataStoreBase, Store {
  late final _$xPlaneDataAtom =
      Atom(name: '_UdpFlightDataStoreBase.xPlaneData', context: context);

  @override
  List<double> get xPlaneData {
    _$xPlaneDataAtom.reportRead();
    return super.xPlaneData;
  }

  @override
  set xPlaneData(List<double> value) {
    _$xPlaneDataAtom.reportWrite(value, super.xPlaneData, () {
      super.xPlaneData = value;
    });
  }

  late final _$_UdpFlightDataStoreBaseActionController =
      ActionController(name: '_UdpFlightDataStoreBase', context: context);

  @override
  void setXPlaneData(List<double> data) {
    final _$actionInfo = _$_UdpFlightDataStoreBaseActionController.startAction(
        name: '_UdpFlightDataStoreBase.setXPlaneData');
    try {
      return super.setXPlaneData(data);
    } finally {
      _$_UdpFlightDataStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
xPlaneData: ${xPlaneData}
    ''';
  }
}
