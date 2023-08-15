import 'package:flutter/material.dart';
import 'package:x_flight_trackr/components/flight_plan_header.dart';
import 'package:x_flight_trackr/components/flight_plan_quantity_selector.dart';
import 'package:x_flight_trackr/components/flight_plan_submit_button.dart';
import 'package:x_flight_trackr/components/flight_plan_text_field.dart';
import 'package:x_flight_trackr/store/form_store.dart';

class FlightPlanForm extends StatelessWidget {
  const FlightPlanForm({
    Key? key,
    required GlobalKey<FormState> formKey,
    required this.onSubmit,
    required this.formStore,
  })  : _formKey = formKey,
        super(key: key);

  final GlobalKey<FormState> _formKey;
  final FormStore formStore;
  final VoidCallback? onSubmit;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Form(
        key: _formKey,
        child: Padding(
          padding:
              EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const FlightPlanHeader(),
              FlightPlanTextField(
                onChanged: formStore.setFrom,
                labelText: 'From',
                hintText: 'Enter departure airport name or ICAO code',
              ),
              FlightPlanTextField(
                onChanged: formStore.setTo,
                labelText: 'To',
                hintText: 'Enter arrival airport name or ICAO code',
              ),
              FlightPlanQuantitySelector(formStore: formStore),
              FlightPlanSubmitButton(onSubmit: onSubmit),
            ],
          ),
        ),
      ),
    );
  }
}
