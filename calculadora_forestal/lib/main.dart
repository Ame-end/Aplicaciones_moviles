import 'package:flutter/material.dart';
import 'package:calculadora_forestal/screens/home_screen.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculadora Forestal',
      theme: ThemeData(
        scaffoldBackgroundColor: Color.fromARGB(255, 124, 135, 92),
        textTheme: GoogleFonts.notoSansTextTheme(),
      ),
      home: const HomeScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
