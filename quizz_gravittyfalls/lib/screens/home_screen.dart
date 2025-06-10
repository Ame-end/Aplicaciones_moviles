import 'package:flutter/material.dart';
import '../screens/ventana_biomasa.dart';
import '../screens/ventana_volumen.dart';
import '../widgets/boton_calcular.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Calculadora Forestal')),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/forest_bg.jpg'),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(Colors.black54, BlendMode.darken),
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              BotonCalcular(
                texto: 'Calcular Volumen',
                icono: Icons.straighten,
                color: Colors.blue,
                onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const VentanaVolumen(),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              BotonCalcular(
                texto: 'Calcular Biomasa',
                icono: Icons.grass,
                color: Colors.green,
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
