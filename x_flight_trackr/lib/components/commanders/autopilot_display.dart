import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:x_flight_trackr/components/commanders/radial_button.dart';

class AutopilotDisplay extends StatelessWidget {
  final double value;
  final String text;
  final void Function(DragUpdateDetails) onPanUpdate;

  const AutopilotDisplay({
    super.key,
    required this.value,
    required this.text,
    required this.onPanUpdate,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        RadialButton(
          icon: Icons.sync_outlined,
          radius: 30,
          onPanUpdate: onPanUpdate,
        ),
        const SizedBox(width: 5),
        Container(
          margin: const EdgeInsets.symmetric(vertical: 2.0),
          height: 50,
          width: MediaQuery.of(context).size.width * 0.3,
          padding: const EdgeInsets.all(5),
          decoration: BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadius.circular(2),
            border: Border.all(
              color: Colors.grey,
              width: 1,
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.5),
                spreadRadius: 3,
                blurRadius: 3,
                offset: const Offset(0, 1),
              )
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(height: 5),
                  Text(
                    text,
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.red,
                      fontFamily: GoogleFonts.vt323().fontFamily,
                      fontWeight: FontWeight.w100,
                      shadows: List.generate(
                        3,
                        (index) => const Shadow(
                          color: Colors.red,
                          blurRadius: 30,
                          offset: Offset(0, 1),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Text(
                value.toInt().toString(),
                style: TextStyle(
                  fontSize: 25,
                  color: Colors.red,
                  fontFamily: GoogleFonts.vt323().fontFamily,
                  shadows: List.generate(
                    3,
                    (index) => const Shadow(
                      color: Colors.red,
                      blurRadius: 70,
                      offset: Offset(0, 1),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
