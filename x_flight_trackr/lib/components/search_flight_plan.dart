import 'package:flutter/material.dart';
import 'package:x_flight_trackr/components/flight_plan_form.dart';
import 'package:x_flight_trackr/pages/flight_plan_result_page.dart';
import 'package:x_flight_trackr/utils/flight_plan_database.dart';

class SearchFlightPlan extends StatefulWidget {
  const SearchFlightPlan({Key? key}) : super(key: key);

  @override
  _SearchFlightPlanState createState() => _SearchFlightPlanState();
}

class _SearchFlightPlanState extends State<SearchFlightPlan> {
  final TextEditingController _fromController = TextEditingController();
  final TextEditingController _toController = TextEditingController();
  final FlightPlanDatabase _flightPlanDatabase = FlightPlanDatabase();
  final _formKey = GlobalKey<FormState>();
  int _quantity = 1;

  @override
  void dispose() {
    _fromController.dispose();
    _toController.dispose();
    super.dispose();
  }

  Future<List<Map<String, dynamic>>> _submit() async {
    try {
      var result = await _flightPlanDatabase.searchFlightPlan(
          _fromController.text, _toController.text, _quantity.toString());
      print(result);
      if (result[0].containsKey('error')) {
        throw Exception('Error in searchFlightPlan');
      }
      return result;
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('An error occurred while searching flight plan'),
        ),
      );
      return [];
    }
  }

  @override
  Widget build(BuildContext context) {
    return TextButton.icon(
      icon: const Icon(Icons.flight_takeoff_outlined),
      label: const Text('Search Flight Plan'),
      onPressed: () {
        showModalBottomSheet(
          context: context,
          builder: (context) => StatefulBuilder(
            builder: (BuildContext context, StateSetter modalState) {
              return Container(
                height: MediaQuery.of(context).size.height * 0.5,
                child: FlightPlanForm(
                  formKey: _formKey,
                  fromController: _fromController,
                  toController: _toController,
                  quantity: _quantity,
                  onQuantityDecrease: _quantity > 1
                      ? () => modalState(() => _quantity--)
                      : null,
                  onQuantityIncrease: _quantity < 3
                      ? () => modalState(() => _quantity++)
                      : null,
                  onSubmit: _formKey.currentState?.validate() ?? false
                      ? () async {
                          var result = await _submit();
                          if (result.isNotEmpty) {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => FlightPlanResultPage(
                                  results: result,
                                ),
                              ),
                            );
                          }
                        }
                      : null,
                ),
              );
            },
          ),
        );
      },
    );
  }
}
