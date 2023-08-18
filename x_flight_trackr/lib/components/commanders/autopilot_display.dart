import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AutopilotDisplay extends StatelessWidget {
  final double value;
  final String text;

  const AutopilotDisplay({super.key, required this.value, required this.text});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          height: 35,
          width: 35,
          decoration: BoxDecoration(
            color: Colors.black38,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.5),
                spreadRadius: 3,
                blurRadius: 3,
                offset: const Offset(0, 1),
              )
            ],
            borderRadius: BorderRadius.circular(100),
            border: Border.all(
              color: Colors.grey,
              width: 1,
            ),
          ),
          child: IconButton(
            color: Colors.grey,
            onPressed: () {},
            icon: const Icon(Icons.settings_outlined, size: 15),
          ),
        ),
        const SizedBox(width: 5),
        Container(
          margin: const EdgeInsets.symmetric(vertical: 2.0),
          height: 50,
          width: 100 + (value.toString().length * 10),
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
              Text(
                value.toInt().toString(),
                style: TextStyle(
                  fontSize: 30,
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
