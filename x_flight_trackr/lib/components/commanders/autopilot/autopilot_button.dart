import 'package:flutter/material.dart';

class AutopilotButton extends StatelessWidget {
  final bool isOn;
  final String text;
  final bool? isArmed;
  final void Function() onPressed;

  const AutopilotButton({
    required this.isOn,
    required this.text,
    required this.onPressed,
    this.isArmed,
    super.key,
  });

  Color _isOn({bool isText = false}) {
    if (isArmed != null && isArmed!) {
      return const Color.fromARGB(255, 238, 179, 18);
    } else {
      if (isOn) {
        return const Color.fromARGB(255, 19, 255, 117);
      } else if (isText) {
        return Colors.white30;
      } else {
        return Colors.transparent;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 35,
      width: 35,
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.grey,
          width: 1,
        ),
        borderRadius: BorderRadius.circular(5),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.5),
            spreadRadius: 1,
            blurRadius: 3,
            offset: const Offset(0, 1),
          )
        ],
      ),
      child: ElevatedButton(
          onPressed: onPressed,
          style: ButtonStyle(
            padding: MaterialStateProperty.all<EdgeInsets>(
              const EdgeInsets.all(0),
            ),
            backgroundColor: MaterialStateProperty.all<Color>(
                const Color.fromARGB(221, 37, 37, 37)),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5.0),
              ),
            ),
          ),
          child: AnimatedSwitcher(
            duration: const Duration(milliseconds: 500),
            child: Column(
              children: [
                Container(
                  margin: const EdgeInsets.only(top: 5, bottom: 5),
                  width: 25,
                  height: 5,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: _isOn(isText: true),
                    boxShadow: [
                      BoxShadow(
                        color: _isOn(isText: false),
                        spreadRadius: 2,
                        blurRadius: 4,
                        offset: const Offset(0, 1),
                      )
                    ],
                  ),
                ),
                const SizedBox(height: 3),
                Text(
                  text,
                  maxLines: 1,
                  softWrap: false,
                  style: TextStyle(
                    fontSize: 8,
                    color: _isOn(isText: true),
                    shadows: List<Shadow>.generate(
                      2,
                      (int index) => Shadow(
                        color: _isOn(isText: false),
                        blurRadius: 10,
                        offset: const Offset(0, 1),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )),
    );
  }
}
