import 'package:flutter/material.dart';
import '../configurations/app_theme.dart';
import 'dart:math';

class VentanaBiomasa extends StatefulWidget {
  const VentanaBiomasa({super.key});

  @override
  State<VentanaBiomasa> createState() => _VentanaBiomasaState();
}

class _VentanaBiomasaState extends State<VentanaBiomasa> {
  final TextEditingController _diametroController = TextEditingController();
  String resultado = '';

  void calcularBiomasa() {
    final d = double.tryParse(_diametroController.text);
    if (d == null || d <= 0) {
      _mostrarError('Por favor ingrese un diámetro válido.');
      return;
    }
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

  void _mostrarError(String mensaje) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Error'),
        content: Text(mensaje),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
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
        backgroundColor: Colors.green[800],
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/forest_bg.jpg'),
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
                  backgroundColor: Colors.green[800],
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
