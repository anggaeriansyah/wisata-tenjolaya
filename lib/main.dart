import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'Screens/homeScreen.dart';

void main() {
  runApp(const MyApp());
}

// Color _colorPrime = HexColor("#30475E");
// Color _colorPrime = HexColor("#781C68");
Color _colorPrime = HexColor("#1C6758");
// Color _colorSec = HexColor("#FFF5E1");
Color _colorSec = HexColor("#F5F5F5");

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Wisata Tenjolaya',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          // textTheme: GoogleFonts.rubikTextTheme(),
          primaryColor: _colorPrime,
          accentColor: Colors.grey.shade600,
          textSelectionColor: Colors.grey.shade300,
          canvasColor: _colorSec,
          scaffoldBackgroundColor: _colorSec),
      home: HomeScreen(),
    );
  }
}

class HexColor extends Color {
  static int _getColor(String hex) {
    String formattedHex = "FF" + hex.toUpperCase().replaceAll("#", "");
    return int.parse(formattedHex, radix: 16);
  }

  HexColor(final String hex) : super(_getColor(hex));
}
