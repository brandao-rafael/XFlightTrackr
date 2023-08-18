import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AutopilotDisplay extends StatelessWidget {
  final double value;
  final String text;

  const AutopilotDisplay({super.key, required this.value, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: 100 + (value.toString().length * 10),
      padding: const EdgeInsets.all(5),
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(2),
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
            ),
          ),
          Text(
            value.toInt().toString(),
            style: TextStyle(
              fontSize: 30,
              color: Colors.red,
              fontFamily: GoogleFonts.vt323().fontFamily,
            ),
          ),
        ],
      ),
    );
  }
}
