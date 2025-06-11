import 'package:flutter/material.dart';

/// Clase que define el tema de la aplicación
/// incluyendo colores, estilos de texto y temas de AppBar.
class AppTheme {
  /// Tema claro de la aplicación
  static final ThemeData lightTheme = ThemeData(
    // Define el color primario de la aplicación
    primarySwatch: Colors.brown,
    appBarTheme: AppBarTheme(
      color: const Color.fromARGB(255, 92, 145, 1),
      titleTextStyle: const TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
    ),
  );

  static const TextStyle resultTextStyle = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.bold,
  );
}
