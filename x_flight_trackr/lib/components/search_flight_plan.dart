import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:x_flight_trackr/utils/flight_plan_database.dart';

class SearchFlightPlan extends StatefulWidget {
  const SearchFlightPlan({Key? key}) : super(key: key);

  @override
  _SearchFlightPlanState createState() => _SearchFlightPlanState();
}

class _SearchFlightPlanState extends State<SearchFlightPlan> {
  final TextEditingController _fromController = TextEditingController();
  final TextEditingController _toController = TextEditingController();
  final FlightPlanDatabase _flightPlanDatabase = FlightPlanDatabase();
  int _quantity = 1;

  Future<void> _launchUrl(String url) async {
    if (!await launchUrl(Uri.parse(url))) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Could not launch $url'),
        ),
      );
    }
  }

  bool _validadeState() {
    if (_fromController.text.isEmpty ||
        _toController.text.isEmpty ||
        _toController.text.length < 4 ||
        _fromController.text.length < 4) {
      return false;
    }
    return true;
  }

  Future<List<Map<String, dynamic>>> _submit() async {
    try {
      var result = await _flightPlanDatabase.searchFlightPlan(
          _fromController.text, _toController.text, _quantity.toString());
      if (result[0].containsKey('error')) {
        throw Exception('Error in searchFlightPlan');
      }
      return result;
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('An error occurred while searching flight plan'),
        ),
      );
      return [];
    }
  }

  @override
  Widget build(BuildContext context) {
    return TextButton.icon(
      icon: const Icon(Icons.flight_takeoff_outlined),
      label: const Text('Search Flight Plan'),
      onPressed: () {
        showModalBottomSheet(
          context: context,
          builder: (context) => StatefulBuilder(
            builder: (BuildContext context, StateSetter modalState) {
              return SizedBox(
                height: MediaQuery.of(context).size.height * 0.5,
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Text(
                          'Search Flight Plan',
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.black,
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
                    ),
                    TextField(
                      controller: _fromController,
                      style: const TextStyle(color: Colors.black),
                      decoration: const InputDecoration(
                        labelText: 'From',
                        hintText: 'Enter departure airport name or ICAO code',
                      ),
                    ),
                    TextField(
                      controller: _toController,
                      style: const TextStyle(color: Colors.black),
                      decoration: const InputDecoration(
                        labelText: 'To',
                        hintText: 'Enter arrival airport name or ICAO code',
                      ),
                    ),
                    Column(
                      children: [
                        const Text(
                          'Select Quantity of Flight Plans',
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.black,
                          ),
                        ),
                        Row(
                          children: [
                            IconButton(
                              color: Colors.red,
                              onPressed: _quantity > 1
                                  ? () {
                                      modalState(() {
                                        _quantity--;
                                      });
                                    }
                                  : null,
                              icon: const Icon(Icons.arrow_downward),
                            ),
                            Text(
                              '$_quantity',
                              style: const TextStyle(
                                fontSize: 18,
                                color: Colors.black,
                              ),
                            ),
                            IconButton(
                              color: Colors.green,
                              onPressed: _quantity < 3
                                  ? () {
                                      modalState(() {
                                        _quantity++;
                                      });
                                    }
                                  : null,
                              icon: const Icon(Icons.arrow_upward),
                            ),
                          ],
                        ),
                        TextButton(
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all<Color>(
                                  Colors.blueAccent[700]!),
                            ),
                            onPressed: _validadeState()
                                ? () async {
                                    await _submit();
                                  }
                                : null,
                            child: const Text(
                              'Search',
                              style: TextStyle(
                                fontSize: 20,
                                color: Colors.white,
                              ),
                            ))
                      ],
                    ),
                  ],
                ),
              );
            },
          ),
        );
      },
    );
  }
}
