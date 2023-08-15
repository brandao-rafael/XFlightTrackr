import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:x_flight_trackr/components/black_text.dart';
import 'package:x_flight_trackr/store/form_store.dart';

class FlightPlanQuantitySelector extends StatelessWidget {
  const FlightPlanQuantitySelector({
    Key? key,
    required this.formStore,
  }) : super(key: key);

  final FormStore formStore;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 10),
        const BlackText('Select how many plans you want to see:'),
        const SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
              color: Colors.red,
              onPressed: formStore.decreaseQuantity,
              icon: const Icon(Icons.arrow_downward),
            ),
            Observer(builder: (_) {
              return Text(
                '${formStore.quantity}',
                style: const TextStyle(
                  fontSize: 18,
                  color: Colors.black,
                ),
              );
            }),
            IconButton(
              color: Colors.green,
              onPressed: formStore.increaseQuantity,
              icon: const Icon(Icons.arrow_upward),
            ),
          ],
        ),
        const SizedBox(height: 10),
      ],
    );
  }
}
