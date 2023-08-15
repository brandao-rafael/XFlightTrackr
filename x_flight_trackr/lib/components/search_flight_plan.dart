import 'package:flutter/material.dart';
import 'package:x_flight_trackr/components/flight_plan_form.dart';
import 'package:x_flight_trackr/pages/flight_plan_result_page.dart';
import 'package:x_flight_trackr/store/flight_plan_store.dart';
import 'package:x_flight_trackr/store/form_store.dart';

class SearchFlightPlan extends StatefulWidget {
  final FlightPlanStore store;
  const SearchFlightPlan({Key? key, required this.store}) : super(key: key);

  @override
  _SearchFlightPlanState createState() => _SearchFlightPlanState();
}

class _SearchFlightPlanState extends State<SearchFlightPlan> {
  final _formKey = GlobalKey<FormState>();
  final FormStore _formStore = FormStore();

  Future<void> _submit(
      BuildContext context, ValueNotifier<bool> isLoadingNotifier) async {
    if (_formKey.currentState?.validate() ?? false) {
      isLoadingNotifier.value = true;
      try {
        await _searchFlightPlans();
        if (mounted) {
          _handleSearchResults(context);
        }
      } catch (e) {
        if (mounted) {
          _showError(context);
        }
      } finally {
        isLoadingNotifier.value = false;
      }
    }
  }

  Future<List<dynamic>> _searchFlightPlans() async {
    var result = await widget.store.searchFlightPlans(
        _formStore.from, _formStore.to, _formStore.quantity.toString());

    if (result.isNotEmpty && result[0].containsKey('error')) {
      throw Exception('Error in searchFlightPlan');
    }

    return result;
  }

  void _handleSearchResults(BuildContext context) {
    if (widget.store.flightPlans.isNotEmpty) {
      Navigator.pop(context);
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) =>
              FlightPlanResultPage(flightPlanStore: widget.store),
        ),
      );
    }
  }

  void _showError(BuildContext context) {
    Navigator.pop(context);
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: Colors.red[600]!,
        content: const Text('An error occurred while searching flight plan'),
        duration: const Duration(seconds: 4),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return TextButton.icon(
      icon: const Icon(Icons.airplane_ticket_outlined),
      label: const Text('Search Flight Plan'),
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(Colors.white70),
      ),
      onPressed: () => _showModalBottomSheet(context),
    );
  }

  void _showModalBottomSheet(BuildContext context) {
    final isLoadingNotifier = ValueNotifier<bool>(false);

    showModalBottomSheet(
      isScrollControlled: true,
      backgroundColor: Colors.white,
      shape: const BeveledRectangleBorder(
        borderRadius: BorderRadius.all(Radius.zero),
      ),
      useSafeArea: true,
      context: context,
      builder: (context) => StatefulBuilder(
        builder: (BuildContext context, StateSetter modalState) {
          return ValueListenableBuilder<bool>(
            valueListenable: isLoadingNotifier,
            builder: (context, isLoading, child) {
              return SizedBox(
                child: isLoading
                    ? SizedBox(
                        height: MediaQuery.of(context).size.height * 0.3,
                        width: double.infinity,
                        child: const Center(child: CircularProgressIndicator()),
                      )
                    : FlightPlanForm(
                        formStore: _formStore,
                        formKey: _formKey,
                        onSubmit: () => _submit(context, isLoadingNotifier),
                      ),
              );
            },
          );
        },
      ),
    );
  }
}
