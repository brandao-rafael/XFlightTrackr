import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:x_flight_trackr/components/commanders/system/painters/flap_painter.dart';
import 'package:x_flight_trackr/store/systems_commander_store.dart';

class FlapSlider extends StatefulWidget {
  final ValueChanged<double> onChanged;

  const FlapSlider({Key? key, required this.onChanged}) : super(key: key);

  @override
  _FlapSliderState createState() => _FlapSliderState();
}

class _FlapSliderState extends State<FlapSlider> {
  double _currentValue = 0.0;

  @override
  void initState() {
    super.initState();
    _currentValue = context.read<SystemsCommanderStore>().flapsPosition;
  }

  @override
  Widget build(BuildContext context) {
    final systemStore = context.watch<SystemsCommanderStore>();
    return SizedBox(
      height: 175,
      child: Column(
        children: [
          Text('Flaps',
              style: TextStyle(
                fontSize: 10,
                color: Colors.grey[100],
              )),
          const SizedBox(height: 10),
          GestureDetector(
            onVerticalDragUpdate: (details) {
              setState(() {
                double newValue =
                    1.0 - (details.localPosition.dy / context.size!.height);
                if (newValue < 0) {
                  newValue = 0.0;
                } else if (newValue > 1.0) {
                  newValue = 1.0;
                }
                _currentValue = newValue;
                widget.onChanged(_currentValue);
                systemStore.setFlapsPosition(_currentValue);
              });
            },
            child: CustomPaint(
              size: const Size(
                  50, 150), // Width of 50 and height of 200, adjust as needed
              painter: FlapPainter(_currentValue),
            ),
          ),
        ],
      ),
    );
  }
}
