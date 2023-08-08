import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class FlightPlanDataBaseLogo extends StatelessWidget {
  const FlightPlanDataBaseLogo({super.key});

  Future<void> _launchUrl(String url) async {
    if (!await launchUrl(Uri.parse(url))) {
      null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        _launchUrl('https://flightplandatabase.com');
      },
      child: Image.network(
        'https://static.flightplandatabase.com/images/data-banner/light.min.png',
        width: 150,
      ),
    );
  }
}
