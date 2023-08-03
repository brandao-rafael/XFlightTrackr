import 'package:flutter/material.dart';
import 'package:x_flight_trackr/components/flight_plan_header.dart';
import 'package:x_flight_trackr/components/flight_plan_quantity_selector.dart';
import 'package:x_flight_trackr/components/flight_plan_submit_button.dart';
import 'package:x_flight_trackr/components/flight_plan_text_field.dart';

class FlightPlanForm extends StatelessWidget {
  const FlightPlanForm({
    Key? key,
    required GlobalKey<FormState> formKey,
    required this.fromController,
    required this.toController,
    required this.quantity,
    required this.onQuantityDecrease,
    required this.onQuantityIncrease,
    required this.onSubmit,
  })  : _formKey = formKey,
        super(key: key);

  final GlobalKey<FormState> _formKey;
  final TextEditingController fromController;
  final TextEditingController toController;
  final int quantity;
  final VoidCallback? onQuantityDecrease;
  final VoidCallback? onQuantityIncrease;
  final VoidCallback? onSubmit;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          const FlightPlanHeader(),
          FlightPlanTextField(
            controller: fromController,
            labelText: 'From',
            hintText: 'Enter departure airport name or ICAO code',
          ),
          FlightPlanTextField(
            controller: toController,
            labelText: 'To',
            hintText: 'Enter arrival airport name or ICAO code',
          ),
          FlightPlanQuantitySelector(
            quantity: quantity,
            onDecrease: onQuantityDecrease,
            onIncrease: onQuantityIncrease,
          ),
          FlightPlanSubmitButton(onSubmit: onSubmit),
        ],
      ),
    );
  }
}
