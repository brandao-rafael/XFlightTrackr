import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ParkingBrakeLight extends StatelessWidget {
  final bool isOn;
  const ParkingBrakeLight({super.key, required this.isOn});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AnimatedSwitcher(
          duration: const Duration(milliseconds: 500),
          child: Container(
            height: 35,
            width: 55,
            decoration: BoxDecoration(
              color: Colors.black,
              boxShadow: isOn
                  ? [
                      const BoxShadow(
                        color: Colors.red,
                        spreadRadius: 2,
                        blurRadius: 4,
                        offset: Offset(0, 1),
                      )
                    ]
                  : null,
              borderRadius: BorderRadius.circular(5),
            ),
            child: Center(
                child: Text(
              'BRAKE',
              style: TextStyle(
                color: isOn ? Colors.red : Colors.white30,
                fontSize: 20,
                fontWeight: FontWeight.w900,
                fontFamily: GoogleFonts.vt323().fontFamily,
                shadows: isOn
                    ? List.generate(
                        2,
                        (index) => const Shadow(
                          color: Colors.red,
                          blurRadius: 30,
                          offset: Offset(0, 1),
                        ),
                      )
                    : null,
              ),
            )),
          ),
        ),
      ],
    );
  }
}
