import 'dart:convert';

import 'package:http/http.dart' as http;

class FlightPlanDatabase {
  Future<List<Map<String, dynamic>>> searchFlightPlan(
      String from, String to, String quantity) async {
    try {
      final result = await http.get(Uri.parse(
          'https://api.flightplandatabase.com/search/plans?from=$from&to=$to&limit=$quantity'));
      print(result.body);
      if (result.statusCode != 200) {
        return [
          {'error': 'something went wrong'}
        ];
      }
      return json.decode(result.body);
    } catch (e) {
      return [
        {'error': 'something went wrong'}
      ];
    }
  }
}
