import 'package:flutter/material.dart';
import 'package:calculadora_forestal/screens/ventana_biomasa.dart';
import 'package:calculadora_forestal/screens/ventana_volumen.dart';
import 'package:calculadora_forestal/widgets/boton_calcular.dart';

/// Pantalla principal de la aplicación
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  // Construye la interfaz de usuario de la pantalla principal
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Título de la aplicación
        title: const Text('Calculadora Forestal'),
      ),
      body: Container(
        // Fondo con imagen y filtro de color
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/pinos.jpg'),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
              Colors.black54,
              // Aplica un filtro de color oscuro
              BlendMode.darken,
            ),
          ),
        ),
        // Centra los botones en la pantalla
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Botón para calcular volumen
              BotonCalcular(
                texto: 'Calcular Volumen',
                icono: Icons.calculate,
                color: Color(0xFF254435),
                // Redirige a la pantalla de cálculo de volumen
                onPressed: () => Navigator.push(
                  context,
                  // Navega a la ventana de volumen
                  MaterialPageRoute(
                    builder: (context) => const VentanaVolumen(),
                  ),
                ),
              ),
              // Seccion para organizar los botones
              const SizedBox(height: 20),
              BotonCalcular(
                texto: 'Calcular Biomasa',
                icono: Icons.calculate,
                color: Color(0xFF254435),
                // Redirige a la pantalla de cálculo de biomasa
                onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const VentanaBiomasa(),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
