import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class FlightPlanHeader extends StatelessWidget {
  const FlightPlanHeader({Key? key}) : super(key: key);

  Future<void> _launchUrl(String url) async {
    if (!await launchUrl(Uri.parse(url))) {
      null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          'Search Flight Plan',
          style: TextStyle(
            fontSize: 25,
            color: Colors.blueAccent[700]!,
            fontWeight: FontWeight.w300,
          ),
        ),
        InkWell(
          onTap: () {
            _launchUrl('https://flightplandatabase.com');
          },
          child: Image.network(
            'https://static.flightplandatabase.com/images/data-banner/light.min.png',
            width: 150,
          ),
        ),
      ],
    );
  }
}
