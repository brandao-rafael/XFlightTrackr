import 'package:flutter/material.dart';
import 'package:x_flight_trackr/utils/flight_plan_database.dart';

class FlightPlanProvider with ChangeNotifier {
  List<dynamic> _flightPlans = [];
  Map _selectedFlightPlan = {};

  List<dynamic> get flightPlans => _flightPlans;
  Map get selectedFlightPlan => _selectedFlightPlan;

  void setFlightPlans(List<dynamic> plans) {
    _flightPlans = plans;
    notifyListeners();
  }

  Future<void> setSelectedFlightPlan(Map plan) async {
    FlightPlanDatabase fpdb = FlightPlanDatabase();
    var response = await fpdb.fetchFlightPlan('${plan['id']}');
    _selectedFlightPlan = response;
    notifyListeners();
  }
}
