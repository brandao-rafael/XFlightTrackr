import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:x_flight_trackr/components/flight_plan_form.dart';
import 'package:x_flight_trackr/pages/flight_plan_result_page.dart';
import 'package:x_flight_trackr/providers/flight_plan_provider.dart';
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

  Future<void> _submit() async {
    try {
      var result = await _flightPlanDatabase.searchFlightPlan(
          _fromController.text, _toController.text, _quantity.toString());

      if (result[0].containsKey('error')) {
        throw Exception('Error in searchFlightPlan');
      }
      if (result.isNotEmpty) {
        final flightPlanProvider =
            Provider.of<FlightPlanProvider>(context, listen: false);
        flightPlanProvider.setFlightPlans(result);
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('An error occurred while searching flight plan'),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return TextButton.icon(
      icon: const Icon(Icons.airplane_ticket_outlined),
      label: const Text('Search Flight Plan'),
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(Colors.white54),
      ),
      onPressed: () {
        showModalBottomSheet(
          isScrollControlled: true,
          backgroundColor: Colors.white70,
          shape: const BeveledRectangleBorder(
              borderRadius: BorderRadius.all(Radius.zero)),
          useSafeArea: true,
          context: context,
          builder: (context) => StatefulBuilder(
            builder: (BuildContext context, StateSetter modalState) {
              return SizedBox(
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
                          await _submit();
                          Navigator.pop(context);
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  const FlightPlanResultPage(),
                            ),
                          );
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
