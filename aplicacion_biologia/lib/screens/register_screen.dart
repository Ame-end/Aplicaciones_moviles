import 'package:flutter/material.dart';
import '../domain/models.dart';
import '../configurations/routes.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _formKey = GlobalKey<FormState>();
  final UserData _userData = UserData();

  final List<String> genderOptions = ['Femenino', 'Masculino', 'Otro'];
  final List<String> maritalStatusOptions = ['Soltero', 'Casado', 'Viudo'];
  final List<String> educationOptions = [
    'Primaria',
    'Secundaria',
    'Preparatoria',
    'Universidad',
    'Posgrado',
    'Ninguna',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF1F8E9),
      appBar: AppBar(
        title: const Text('Registro', style: TextStyle(color: Colors.white)),
        backgroundColor: const Color(0xFF2E7D32),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Card(
                elevation: 4,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    children: [
                      TextFormField(
                        decoration: InputDecoration(
                          labelText: 'Nombre',
                          labelStyle: const TextStyle(color: Color(0xFF2E7D32)),
                          enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: Color(0xFF8BC34A),
                            ),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: Color(0xFF2E7D32),
                            ),
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        style: const TextStyle(color: Color(0xFF212121)),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Por favor ingresa tu nombre';
                          }
                          if (value.length < 3) {
                            return 'El nombre debe tener al menos 3 caracteres';
                          }
                          if (!RegExp(r'^[a-zA-Z\s]+$').hasMatch(value)) {
                            return 'El nombre solo puede contener letras y espacios';
                          }
                          if (value.length > 50) {
                            return 'El nombre no puede exceder los 50 caracteres';
                          }
                          if (value.contains(RegExp(r'\d'))) {
                            return 'El nombre no puede contener números';
                          }

                          return null;
                        },
                        onSaved: (value) => _userData.name = value,
                      ),
                      const SizedBox(height: 20),
                      TextFormField(
                        decoration: InputDecoration(
                          labelText: 'Localidad',
                          labelStyle: const TextStyle(color: Color(0xFF2E7D32)),
                          enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: Color(0xFF8BC34A),
                            ),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: Color(0xFF2E7D32),
                            ),
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        style: const TextStyle(color: Color(0xFF212121)),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Por favor ingresa tu localidad';
                          }
                          if (value.length < 3) {
                            return 'La localidad debe tener al menos 3 caracteres';
                          }

                          if (!RegExp(r'^[a-zA-Z\s]+$').hasMatch(value)) {
                            return 'La localidad solo puede contener letras y espacios';
                          }
                          if (value.length > 50) {
                            return 'La localidad no puede exceder los 50 caracteres';
                          }
                          if (value.contains(RegExp(r'\d'))) {
                            return 'La localidad no puede contener números';
                          }
                          return null;
                        },
                        onSaved: (value) => _userData.location = value,
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Card(
                elevation: 4,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Sexo',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF2E7D32),
                        ),
                      ),
                      ...genderOptions.map(
                        (gender) => RadioListTile<String>(
                          title: Text(
                            gender,
                            style: const TextStyle(color: Color(0xFF212121)),
                          ),
                          value: gender,
                          groupValue: _userData.gender,
                          activeColor: const Color(0xFF2E7D32),
                          onChanged: (value) {
                            setState(() {
                              _userData.gender = value;
                            });
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Card(
                elevation: 4,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    children: [
                      TextFormField(
                        decoration: InputDecoration(
                          labelText: 'Edad',
                          labelStyle: const TextStyle(color: Color(0xFF2E7D32)),
                          enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: Color(0xFF8BC34A),
                            ),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: Color(0xFF2E7D32),
                            ),
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        keyboardType: TextInputType.number,
                        style: const TextStyle(color: Color(0xFF212121)),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Por favor ingresa tu edad';
                          }
                          if (!RegExp(r'^\d+$').hasMatch(value)) {
                            return 'La edad debe ser un número entero';
                          }
                          if ((int.tryParse(value) ?? 0) < 15 ||
                              (int.tryParse(value) ?? 0) > 80) {
                            return 'La edad debe estar entre 0 y 120';
                          }
                          if (value.length > 3) {
                            return 'La edad no puede exceder los 3 dígitos';
                          }
                          if (value.contains(RegExp(r'\D'))) {
                            return 'La edad no puede contener caracteres no numéricos';
                          }
                          if (value.contains(RegExp(r'\s'))) {
                            return 'La edad no puede contener espacios';
                          }
                          if (value.contains(RegExp(r'^[a-zA-Z]+$'))) {
                            return 'La edad no puede contener letras';
                          }
                          return null;
                        },
                        onSaved: (value) => _userData.age = value,
                      ),
                      const SizedBox(height: 20),
                      TextFormField(
                        decoration: InputDecoration(
                          labelText: 'Grupo Étnico',
                          labelStyle: const TextStyle(color: Color(0xFF2E7D32)),
                          enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: Color(0xFF8BC34A),
                            ),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: Color(0xFF2E7D32),
                            ),
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        style: const TextStyle(color: Color(0xFF212121)),
                        onSaved: (value) => _userData.ethnicGroup = value,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Por favor ingresa tu Grupo Étnico';
                          }
                          if (value.length < 3) {
                            return 'El nombre debe tener al menos 3 caracteres';
                          }
                          if (!RegExp(r'^[a-zA-Z\s]+$').hasMatch(value)) {
                            return 'El nombre solo puede contener letras y espacios';
                          }

                          if (value.contains(RegExp(r'\d'))) {
                            return 'El nombre no puede contener números';
                          }

                          return null;
                        },
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Card(
                elevation: 4,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Escolaridad',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF2E7D32),
                        ),
                      ),
                      const SizedBox(height: 10),
                      DropdownButtonFormField<String>(
                        items: educationOptions
                            .map(
                              (level) => DropdownMenuItem(
                                value: level,
                                child: Text(
                                  level,
                                  style: const TextStyle(
                                    color: Color(0xFF212121),
                                  ),
                                ),
                              ),
                            )
                            .toList(),
                        decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: Color(0xFF8BC34A),
                            ),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: Color(0xFF2E7D32),
                            ),
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        style: const TextStyle(color: Color(0xFF212121)),
                        dropdownColor: const Color(0xFFF1F8E9),
                        onChanged: (value) {
                          setState(() {
                            _userData.education = value;
                          });
                        },
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Card(
                elevation: 4,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Estado Civil',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF2E7D32),
                        ),
                      ),
                      ...maritalStatusOptions.map(
                        (status) => RadioListTile<String>(
                          title: Text(
                            status,
                            style: const TextStyle(color: Color(0xFF212121)),
                          ),
                          value: status,
                          groupValue: _userData.maritalStatus,
                          activeColor: const Color(0xFF2E7D32),

                          onChanged: (value) {
                            setState(() {
                              _userData.maritalStatus = value;
                            });
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Card(
                elevation: 4,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    children: [
                      TextFormField(
                        decoration: InputDecoration(
                          labelText: 'Tenencia de la tierra',
                          labelStyle: const TextStyle(color: Color(0xFF2E7D32)),
                          enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: Color(0xFF8BC34A),
                            ),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: Color(0xFF2E7D32),
                            ),
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        style: const TextStyle(color: Color(0xFF212121)),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Por favor ingresa la cantidad';
                          }
                          if (value.length < 1) {
                            return 'El nombre debe tener al menos 2 caracteres';
                          }
                          if (value.length > 50) {
                            return 'El nombre no puede exceder los 50 caracteres';
                          }
                          if (!RegExp(r'^\d+$').hasMatch(value)) {
                            return 'Este campo solo debe contener números';
                          }

                          return null;
                        },
                        onSaved: (value) => _userData.landOwnership = value,
                      ),
                      const SizedBox(height: 20),
                      TextFormField(
                        decoration: InputDecoration(
                          labelText: 'Fuente de trabajo',
                          labelStyle: const TextStyle(color: Color(0xFF2E7D32)),
                          enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: Color(0xFF8BC34A),
                            ),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: Color(0xFF2E7D32),
                            ),
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        style: const TextStyle(color: Color(0xFF212121)),
                        onSaved: (value) => _userData.workSource = value,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Por favor ingresa tu fuente de trabajo';
                          }
                          if (value.length > 10) {
                            return 'El nombre debe tener al menos 3 caracteres';
                          }
                          if (value.length > 25) {
                            return 'El nombre no puede exceder los 50 caracteres';
                          }
                          if (value.contains(RegExp(r'\d'))) {
                            return 'El nombre no puede contener números';
                          }
                          return null;
                        },
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 30),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFFFC107),
                  foregroundColor: const Color(0xFF212121),
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  elevation: 5,
                ),
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
                    Navigator.pushNamed(context, Routes.questions);
                  }
                },
                child: const Text('Comenzar', style: TextStyle(fontSize: 18)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
