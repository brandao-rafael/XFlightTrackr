import 'dart:convert';

import 'package:http/http.dart' as http;

class FlightPlanDatabase {
  Future<List<dynamic>> searchFlightPlan(
      String from, String to, String quantity) async {
    try {
      final result = await http.get(Uri.parse(
          'https://api.flightplandatabase.com/search/plans?from=${from.trim()}&to=${to.trim()}&limit=$quantity'));

      if (result.statusCode == 429) {
        return [
          {'error': 'too many requests'}
        ];
      }

      if (result.statusCode == 200) {
        return json.decode(result.body);
      }

      return [
        {'error': 'something went wrong'}
      ];
    } catch (e) {
      return [
        {'error': 'something went wrong'}
      ];
    }
  }

  Future<Map> fetchFlightPlan(String id) async {
    return http
        .get(Uri.parse('https://api.flightplandatabase.com/plan/$id'))
        .then((response) {
      print(response.body);
      if (response.statusCode == 200) {
        return json.decode(response.body);
      } else {
        return {'error': 'something went wrong'};
      }
    });
  }
}
