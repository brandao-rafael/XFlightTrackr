import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:x_flight_trackr/pages/commander_page.dart';
import 'package:x_flight_trackr/pages/home_page.dart';
import 'package:x_flight_trackr/store/autopilot_store.dart';
import 'package:x_flight_trackr/store/efis_commander_store.dart';
import 'package:x_flight_trackr/store/flight_plan_store.dart';
import 'package:x_flight_trackr/store/form_store.dart';
import 'package:x_flight_trackr/store/systems_commander_store.dart';

void main() async {
  runApp(const MyApp());
  await dotenv.load(fileName: ".env");
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int _selectedIndex = 0;
  late List<Map<String, Object>> _pages;
  final FlightPlanStore flightPlanStore = FlightPlanStore();

  @override
  void initState() {
    super.initState();
    _pages = [
      {
        'title': 'XFlight Trackr',
        'page': HomePage(
          flightPlanStore: flightPlanStore,
        )
      },
      {'title': 'Commander', 'page': CommanderPage()},
    ];
  }

  _selectScreen(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  ThemeData _buildThemeData() {
    return ThemeData(
      colorScheme: ColorScheme.fromSeed(seedColor: Colors.blueAccent[700]!),
      useMaterial3: true,
      textButtonTheme: TextButtonThemeData(
        style: ButtonStyle(
          foregroundColor: MaterialStateProperty.all(Colors.blueAccent[700]),
        ),
      ),
      appBarTheme: AppBarTheme(
        backgroundColor: Colors.blueAccent[700] ?? Colors.blueAccent,
        foregroundColor: Colors.white,
      ),
      textTheme: TextTheme(
        bodyLarge: TextStyle(
            color: Colors.white,
            fontFamily: GoogleFonts.montserrat().fontFamily),
        bodyMedium: TextStyle(
          color: Colors.white,
          fontFamily: GoogleFonts.montserrat().fontFamily,
        ),
        bodySmall: TextStyle(
            color: Colors.white,
            fontFamily: GoogleFonts.montserrat().fontFamily),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider(create: (_) => FormStore()),
        Provider(create: (_) => FlightPlanStore()),
        Provider(create: (_) => AutopilotStore()),
        Provider(create: (_) => EFISCommanderStore()),
        Provider(create: (_) => SystemsCommanderStore()),
      ],
      child: MaterialApp(
        theme: _buildThemeData(),
        home: Scaffold(
          appBar: AppBar(
            centerTitle: true,
            backgroundColor: Colors.blueAccent[700],
            title: Text(
              _pages[_selectedIndex]['title'] as String,
              style: TextStyle(
                fontSize: 20,
                fontFamily: GoogleFonts.montserrat().fontFamily,
              ),
            ),
          ),
          body: _pages[_selectedIndex]['page'] as Widget,
          bottomNavigationBar: BottomNavigationBar(
            onTap: _selectScreen,
            backgroundColor: Colors.blueAccent[700],
            unselectedItemColor: Colors.white,
            selectedItemColor: Colors.white54,
            currentIndex: _selectedIndex,
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.settings),
                label: 'Commander',
              ),
            ],
          ),
          // home: CommanderPage(),
          // home: HomePage(),
        ),
      ),
    );
  }
}
