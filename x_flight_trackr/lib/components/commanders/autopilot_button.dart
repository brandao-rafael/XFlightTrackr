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
    return SizedBox(
      height: 35,
      width: 35,
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
                ),
              ),
              Text(
                text,
                maxLines: 1,
                softWrap: false,
                style: TextStyle(
                  fontSize: 8,
                  color: Colors.amberAccent[100],
                ),
              ),
            ],
          )),
    );
  }
}
