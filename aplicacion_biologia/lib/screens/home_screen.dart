import 'package:flutter/material.dart';
import '../widgets/tarantula_info_dialog.dart';
import '../configurations/routes.dart';
import '../widgets/info.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF1F8E9),
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text(
                  'TEEGRO APP',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w900,
                    color: Color.fromARGB(255, 6, 119, 11),
                  ),
                ),
                const SizedBox(height: 30),
                GestureDetector(
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (context) => const TarantulaInfoDialog(),
                    );
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: const Color(0xFF8BC34A),
                      borderRadius: BorderRadius.circular(15),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 2,
                          blurRadius: 5,
                          offset: const Offset(0, 3),
                        ),
                      ],
                    ),
                    padding: const EdgeInsets.all(20),
                    child: const Icon(
                      Icons.pest_control,
                      size: 80,
                      color: Colors.white,
                    ),
                  ),
                ),
                const SizedBox(height: 30),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Text(
                    'Conservación de la tarantula\nmexicana de \n terciopelo negro',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 16, color: Color(0xFF212121)),
                  ),
                ),
                const SizedBox(height: 40),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFFFC107),
                    foregroundColor: const Color(0xFF212121),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 40,
                      vertical: 15,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  onPressed: () {
                    Navigator.pushNamed(context, Routes.register);
                  },
                  child: const Text(
                    'Registrarse',
                    style: TextStyle(fontSize: 18),
                  ),
                ),
                const SizedBox(height: 20),
                TextButton(
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        title: const Text(
                          'Información del Proyecto',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            color: Color.fromARGB(255, 25, 26, 32),
                            fontSize: 20,
                          ),
                        ),
                        content: SingleChildScrollView(
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              // Logo
                              Image.asset(
                                'Assets/Images/unsijLogo.png',
                                height: 100,
                              ),
                              const SizedBox(height: 16),
                              // Contenido de texto con estilos
                              RichText(
                                text: TextSpan(
                                  style: const TextStyle(
                                    fontSize: 14,
                                    color: Colors.black87,
                                    height: 1.4,
                                    fontFamily: 'Roboto',
                                  ),
                                  children: [
                                    // Encargado
                                    const TextSpan(
                                      text: 'Encargado del proyecto:\n',
                                      style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        color: Colors.indigo,
                                        fontSize: 15,
                                      ),
                                    ),
                                    const TextSpan(
                                      text:
                                          'Doc. Miguel Ángel García García\n\n',
                                      style: TextStyle(
                                        fontStyle: FontStyle.italic,
                                        color: Colors.indigo,
                                      ),
                                    ),
                                    // Responsable
                                    const TextSpan(
                                      text: 'Proyecto a cargo de:\n',
                                      style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        color: Colors.indigo,
                                        fontSize: 15,
                                      ),
                                    ),
                                    const TextSpan(
                                      text: 'Doc. Alberto Martínez Barbosa\n\n',
                                      style: TextStyle(
                                        fontStyle: FontStyle.italic,
                                        color: Colors.indigo,
                                      ),
                                    ),
                                    // Desarrolladores
                                    const TextSpan(
                                      text: 'Desarrolladores:\n',
                                      style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        color: Colors.indigo,
                                        fontSize: 15,
                                      ),
                                    ),
                                    TextSpan(
                                      text: '• Implementación del diseño: \n',
                                      style: TextStyle(
                                        decoration: TextDecoration.underline,
                                        color: Colors.teal[700],
                                      ),
                                    ),
                                    const TextSpan(
                                      text: 'Amelia Mendoza López\n',
                                      style: TextStyle(
                                        color: Colors.deepPurple,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                    TextSpan(
                                      text: '• Control de datos:\n ',
                                      style: TextStyle(
                                        decoration: TextDecoration.underline,
                                        color: Colors.teal[700],
                                      ),
                                    ),
                                    const TextSpan(
                                      text: 'Elton Yael Hernández Pérez\n\n',
                                      style: TextStyle(
                                        color: Colors.deepPurple,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                    // Información académica
                                    const TextSpan(
                                      text:
                                          'Sexto semestre de la Licenciatura en Informática\n\n',
                                      style: TextStyle(
                                        fontSize: 13,
                                        color: Colors.grey,
                                        fontStyle: FontStyle.italic,
                                      ),
                                    ),
                                    // Descripción del proyecto
                                    const TextSpan(
                                      text:
                                          'Este proyecto busca estudiar la conservación de la tarántula Mexicana de terciopelo negro',

                                      //alinear
                                      style: TextStyle(
                                        fontStyle: FontStyle.italic,
                                        color: Colors.green,
                                        backgroundColor: Color(0xFFE8F5E9),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                  child: const Text(
                    'Ver detalles',
                    style: TextStyle(
                      color: Color.fromARGB(255, 181, 212, 97),
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
