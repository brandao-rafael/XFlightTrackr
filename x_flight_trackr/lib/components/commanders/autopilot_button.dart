import 'package:flutter/material.dart';

class AutopilotButton extends StatelessWidget {
  final bool isOn;
  final String text;
  final void Function() onPressed;

  const AutopilotButton({
    required this.isOn,
    required this.text,
    super.key,
    required this.onPressed,
  });

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
          child: Column(
            children: [
              Container(
                margin: const EdgeInsets.only(top: 5, bottom: 5),
                width: 25,
                height: 5,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: isOn
                      ? const Color.fromARGB(255, 19, 255, 117)
                      : Colors.white24,
                  boxShadow: [
                    BoxShadow(
                      color: isOn
                          ? const Color.fromARGB(255, 19, 255, 117)
                          : Colors.transparent,
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
                  color: isOn
                      ? const Color.fromARGB(255, 19, 255, 117)
                      : Colors.grey[400],
                  shadows: List<Shadow>.generate(
                    2,
                    (int index) => Shadow(
                      color: isOn
                          ? const Color.fromARGB(255, 19, 255, 117)
                          : Colors.transparent,
                      blurRadius: 10,
                      offset: const Offset(0, 1),
                    ),
                  ),
                ),
              ),
            ],
          )),
    );
  }
}
