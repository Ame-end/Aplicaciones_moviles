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
            image: AssetImage('assets/images/pinos2.jpg'),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
              Colors.black54,
              // Aplica un filtro de color oscuro
              BlendMode.darken,
            ),
          ),
        ),

        // Centra los botones en la pantalla y coloca el botón de desarrolladores abajo
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 24.0, bottom: 32.0),
              /*child: Image.asset(
                'assets/images/unsijLogo.png', // Cambia la ruta por la tuya
                height: 120, // Ajusta el tamaño según lo necesites
              ),*/
            ),
            Expanded(
              child: Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
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
            // Botón de ojo para visualizar desarrolladores
            Padding(
              padding: const EdgeInsets.only(bottom: 24.0),
              child: IconButton(
                icon: const Icon(
                  Icons.remove_red_eye,
                  size: 35,
                  color: Colors.white,
                ),
                tooltip: 'Ver desarrolladores',
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      title: const Text('Desarrolladores'),
                      content: const Text(
                        'Amelia Mendoza López\nElton Yael Hernández Pérez',
                      ), // Cambia por los nombres reales
                      actions: [
                        TextButton(
                          onPressed: () => Navigator.pop(context),
                          child: const Text('Cerrar'),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
