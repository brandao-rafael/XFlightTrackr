import 'package:flutter/material.dart';

class FlightPlanQuantitySelector extends StatelessWidget {
  const FlightPlanQuantitySelector({
    Key? key,
    required this.quantity,
    required this.onDecrease,
    required this.onIncrease,
  }) : super(key: key);

  final int quantity;
  final VoidCallback? onDecrease;
  final VoidCallback? onIncrease;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          color: Colors.red,
          onPressed: onDecrease,
          icon: const Icon(Icons.arrow_downward),
        ),
        Text(
          '$quantity',
          style: const TextStyle(
            fontSize: 18,
            color: Colors.black,
          ),
        ),
        IconButton(
          color: Colors.green,
          onPressed: onIncrease,
          icon: const Icon(Icons.arrow_upward),
        ),
      ],
    );
  }
}