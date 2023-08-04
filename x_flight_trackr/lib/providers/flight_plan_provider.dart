import 'package:flutter/material.dart';

class FlightPlanProvider with ChangeNotifier {
  List<dynamic> _flightPlans = [];
  Map _selectedFlightPlan = {};

  List<dynamic> get flightPlans => _flightPlans;
  Map get selectedFlightPlan => _selectedFlightPlan;

  void setFlightPlans(List<dynamic> plans) {
    _flightPlans = plans;
    notifyListeners();
  }

  void setSelectedFlightPlan(Map plan) {
    _selectedFlightPlan = plan;
    notifyListeners();
  }
}
