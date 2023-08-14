import 'package:mobx/mobx.dart';
import 'package:x_flight_trackr/utils/flight_plan_database.dart';

part 'flight_plan_store.g.dart';

class FlightPlanStore = _FlightPlanStore with _$FlightPlanStore;

abstract class _FlightPlanStore with Store {
  final FlightPlanDatabase _fpdb = FlightPlanDatabase();

  @observable
  List<dynamic> flightPlans = [];

  @observable
  Map selectedFlightPlan = {};

  @action
  void setFlightPlans(List<dynamic> plans) {
    flightPlans = plans;
  }

  @action
  Future<void> setSelectedFlightPlan(Map plan) async {
    var response = await _fpdb.fetchFlightPlan('${plan['id']}');
    selectedFlightPlan = response;
  }

  @action
  Future<List<dynamic>> searchFlightPlans(
      String from, String to, String quantity) async {
    var result = await _fpdb.searchFlightPlan(from, to, quantity);

    if (result.isEmpty || result[0].containsKey('error')) {
      throw Exception('Error in searchFlightPlan');
    }
    setFlightPlans(result);

    return result;
  }
}
