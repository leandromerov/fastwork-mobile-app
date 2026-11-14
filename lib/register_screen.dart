import 'package:flutter/material.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();

  String? selectedDay;
  String? selectedMonth;
  String? selectedYear;
  bool acceptPolicies = false;

  @override
  Widget build(BuildContext context) {
    // Generamos listas para los dropdowns
    List<String> days = List.generate(31, (index) => "${index + 1}");
    List<String> months = [
      "Enero", "Febrero", "Marzo", "Abril", "Mayo", "Junio",
      "Julio", "Agosto", "Septiembre", "Octubre", "Noviembre", "Diciembre"
    ];
    List<String> years = List.generate(2025 - 1930 + 1, (index) => "${1930 + index}");

    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF0A3D62), Color(0xFF1B4F72)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 50),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Botón de volver
              IconButton(
                icon: const Icon(Icons.arrow_back, color: Colors.white),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              const SizedBox(height: 10),

              const Center(
                child: Text(
                  "Registro FASTWORK",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(height: 40),

              // Nombre y Apellido en la misma fila
              Row(
                children: [
                  Expanded(
                    child: _buildInputField("Nombre", Icons.person, firstNameController),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: _buildInputField("Apellido", Icons.person_outline, lastNameController),
                  ),
                ],
              ),
              const SizedBox(height: 20),

              // Fecha de nacimiento
              const Text(
                "Fecha de Nacimiento",
                style: TextStyle(color: Colors.white70, fontSize: 16),
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  Expanded(
                    child: DropdownButtonFormField<String>(
                      initialValue: selectedDay,
                      hint: const Text("Día"),
                      dropdownColor: const Color(0xFF0A3D62),
                      style: const TextStyle(color: Colors.white),
                      items: days.map((day) {
                        return DropdownMenuItem(
                          value: day,
                          child: Text(day, style: const TextStyle(color: Colors.white)),
                        );
                      }).toList(),
                      onChanged: (value) {
                        setState(() {
                          selectedDay = value;
                        });
                      },
                      decoration: _dropdownDecoration(),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: DropdownButtonFormField<String>(
                      initialValue: selectedMonth,
                      hint: const Text("Mes"),
                      dropdownColor: const Color(0xFF0A3D62),
                      style: const TextStyle(color: Colors.white),
                      items: months.map((month) {
                        return DropdownMenuItem(
                          value: month,
                          child: Text(month, style: const TextStyle(color: Colors.white)),
                        );
                      }).toList(),
                      onChanged: (value) {
                        setState(() {
                          selectedMonth = value;
                        });
                      },
                      decoration: _dropdownDecoration(),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: DropdownButtonFormField<String>(
                      initialValue: selectedYear,
                      hint: const Text("Año"),
                      dropdownColor: const Color(0xFF0A3D62),
                      style: const TextStyle(color: Colors.white),
                      items: years.map((year) {
                        return DropdownMenuItem(
                          value: year,
                          child: Text(year, style: const TextStyle(color: Colors.white)),
                        );
                      }).toList(),
                      onChanged: (value) {
                        setState(() {
                          selectedYear = value;
                        });
                      },
                      decoration: _dropdownDecoration(),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),

              _buildInputField("Correo electrónico", Icons.email, emailController),
              const SizedBox(height: 20),

              _buildInputField("Número telefónico", Icons.phone, phoneController),
              const SizedBox(height: 20),

              _buildInputField("Crear contraseña", Icons.lock, passwordController, isPassword: true),
              const SizedBox(height: 20),

              _buildInputField("Confirmar contraseña", Icons.lock_outline, confirmPasswordController, isPassword: true),
              const SizedBox(height: 20),

              // Checkbox políticas
              Row(
                children: [
                  Checkbox(
                    value: acceptPolicies,
                    activeColor: Colors.yellow[700],
                    onChanged: (value) {
                      setState(() {
                        acceptPolicies = value ?? false;
                      });
                    },
                  ),
                  const Expanded(
                    child: Text(
                      "Acepto las políticas de privacidad",
                      style: TextStyle(color: Colors.white70),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),

              // Botón de registro con validaciones
              SizedBox(
                width: double.infinity,
                height: 55,
                child: ElevatedButton(
                  onPressed: () {
                    String email = emailController.text.trim();
                    String password = passwordController.text;
                    String confirmPassword = confirmPasswordController.text;

                    // Validación de correo
                    if (!email.contains("@")) {
                      _showMessage("Correo inválido");
                      return;
                    }

                    // Validación de contraseñas
                    if (password != confirmPassword) {
                      _showMessage("Las contraseñas no coinciden");
                      return;
                    }

                    // Validación de políticas
                    if (!acceptPolicies) {
                      _showMessage("Debes aceptar las políticas");
                      return;
                    }

                    _showMessage("Registro exitoso ✅");
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.yellow[700],
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                  child: const Text(
                    "Registrarse",
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Input reutilizable
  Widget _buildInputField(String hint, IconData icon, TextEditingController controller, {bool isPassword = false}) {
    return TextField(
      controller: controller,
      obscureText: isPassword,
      style: const TextStyle(color: Colors.white),
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: const TextStyle(color: Colors.white70),
        filled: true,
        fillColor: Colors.white24,
        prefixIcon: Icon(icon, color: Colors.white70),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }

  // Estilo dropdowns
  InputDecoration _dropdownDecoration() {
    return InputDecoration(
      filled: true,
      fillColor: Colors.white24,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(15),
        borderSide: BorderSide.none,
      ),
    );
  }

  // Mostrar mensajes
  void _showMessage(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message)),
    );
  }
}
