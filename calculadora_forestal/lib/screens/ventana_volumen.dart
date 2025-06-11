import 'package:flutter/material.dart';
import 'package:calculadora_forestal/configurations/app_theme.dart';
import 'dart:math';

class VentanaVolumen extends StatefulWidget {
  const VentanaVolumen({super.key});

  @override
  State<VentanaVolumen> createState() => _VentanaVolumenState();
}

class _VentanaVolumenState extends State<VentanaVolumen> {
  final TextEditingController _diametroController = TextEditingController();
  final TextEditingController _alturaController = TextEditingController();
  String resultado = '';

  void calcularVolumen() {
    final diametro = double.tryParse(_diametroController.text);
    final altura = double.tryParse(_alturaController.text);

    if (diametro == null || altura == null || diametro <= 0 || altura <= 0) {
      _mostrarError('Por favor ingrese valores válidos.');
      return;
    }
    if (diametro > 400) {
      _mostrarError('El diámetro no puede ser mayor a 400 cm.');
      return;
    }
    if (altura > 60) {
      _mostrarError('La altura no puede ser mayor a 60 m.');
      return;
    }

    double a, b, c;
    if (diametro >= 7.5 && diametro < 32.5) {
      a = 0.000026;
      b = 2.129789;
      c = 0.984286;
    } else if (diametro >= 32.5 && diametro < 39) {
      a = 0.000054;
      b = 1.990294;
      c = 0.897275;
    } else if (diametro >= 39) {
      a = 0.000110;
      b = 1.871412;
      c = 0.828973;
    } else {
      setState(() => resultado = 'El diámetro debe ser al menos 7.5 cm.');
      return;
    }

    // Ecuación original sin simplificar
    final volumen = a * pow(diametro, b).toDouble() * pow(altura, c).toDouble();

    setState(() {
      resultado = 'El volumen fustal es: ${volumen.toStringAsFixed(2)} m³';
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
        title: const Text('Cálculo de Volumen'),
        backgroundColor: Color.fromARGB(255, 124, 135, 92),
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/fondo_Volumen.jpg'),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(Colors.black54, BlendMode.darken),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              _buildInputField(
                controller: _diametroController,
                label: 'Diámetro (cm)',
                icon: Icons.straighten,
              ),
              const SizedBox(height: 20),
              _buildInputField(
                controller: _alturaController,
                label: 'Altura (m)',
                icon: Icons.height,
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: calcularVolumen,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color.fromARGB(255, 63, 66, 62),
                  foregroundColor: Color.fromARGB(255, 168, 187, 162),
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

  Widget _buildInputField({
    required TextEditingController controller,
    required String label,
    required IconData icon,
  }) {
    return TextField(
      controller: controller,
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
        labelText: label,
        border: const OutlineInputBorder(),
        prefixIcon: Icon(icon),
        filled: true,
        fillColor: Colors.white.withOpacity(0.8),
      ),
    );
  }
}
