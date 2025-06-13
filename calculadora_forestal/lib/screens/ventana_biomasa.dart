import 'package:flutter/material.dart';
import 'package:calculadora_forestal/configurations/app_theme.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:math';

/// Pantalla para calcular la biomasa de un árbol
class VentanaBiomasa extends StatefulWidget {
  const VentanaBiomasa({super.key});

  @override
  /// Crea el estado para la ventana de biomasa
  //Permite que la pantalla sea dinámica y actulice el contenido
  State<VentanaBiomasa> createState() => _VentanaBiomasaState();
}

class _VentanaBiomasaState extends State<VentanaBiomasa> {
  //Es el controlador del campo de texto para que el usuario ingrese el diámetro basal
  final TextEditingController _diametroController = TextEditingController();
  //Muestra el resultado del cálculo de biomasa
  String resultado = '';

  //Función que permite calcular la biomasa del árbol
  void calcularBiomasa() {
    //Convierte el texto en un número decimal
    final d = double.tryParse(_diametroController.text);
    //Se debe de válidar que sea un diámetro positivo
    if (d == null || d <= 0) {
      _mostrarError('Por favor ingrese un diámetro válido.');
      return;
    }
    //Válida que el diámetro sea mayor a 400
    if (d > 400) {
      _mostrarError('El diámetro no puede ser mayor a 400 cm.');
      return;
    }

    // Ecuaciones originales sin simplificar
    final hoja = 28.14663 * pow(d, 1.49905).toDouble();
    final rama = 5.2717 * pow(d, 2.3562).toDouble();
    final fuste = 31.0186 * pow(d, 2.6393).toDouble();
    final raiz = 18.61804 * pow(d, 1.92087).toDouble();
    final total = hoja + rama + fuste + raiz;
    final volFuste = 23.86259 * pow(d, 1.67853).toDouble();
    final volRaiz = 35.3235 * pow(d, 2.5239).toDouble();

    setState(() {
      resultado =
          '''
      Biomasa hojas: ${hoja.toStringAsFixed(2)} g
      Biomasa ramas: ${rama.toStringAsFixed(2)} g
      Biomasa fuste: ${fuste.toStringAsFixed(2)} g
      Biomasa raíz: ${raiz.toStringAsFixed(2)} g
      Biomasa total: ${total.toStringAsFixed(2)} g
      Volumen fuste: ${volFuste.toStringAsFixed(2)} cm³
      Volumen raíz: ${volRaiz.toStringAsFixed(2)} cm³
      ''';
    });
  }

  //Se muestra el cuadro de dialogo en pantalla con el mensaje de error
  void _mostrarError(String mensaje) {
    showDialog(
      context:
          context, //Contexto es implementado para que flutter sepa dónde mostrar el cuadro de diálogo
      builder: (context) => AlertDialog(
        //Construye el cuadro de diálogo
        title: const Text('Error'), //Título del cuadro de diálogo
        content: Text(mensaje),
        actions: [
          //Botón implementado para cerrar el cuadro de diálogo
          TextButton(
            onPressed: () => Navigator.pop(
              context,
            ), //Se cerrará el cuadro de texto al dar click
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cálculo de Biomasa'),
        backgroundColor: Color.fromARGB(255, 124, 135, 92),
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/fondo_Biomasa.jpg'),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(Colors.black54, BlendMode.darken),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              TextField(
                controller: _diametroController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: 'Diámetro basal (cm)',
                  border: const OutlineInputBorder(),
                  prefixIcon: const Icon(Icons.nature),
                  filled: true,
                  fillColor: Colors.white.withOpacity(0.8),
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: calcularBiomasa,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color.fromARGB(255, 47, 118, 24),
                  foregroundColor: Color.fromARGB(255, 142, 175, 132),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 40,
                    vertical: 15,
                  ),
                ),
                child: const Text('CALCULAR', style: TextStyle(fontSize: 18)),
              ),
              const SizedBox(height: 20),
              Text(resultado, style: AppTheme.resultTextStyle),
            ],
          ),
        ),
      ),
    );
  }
}
