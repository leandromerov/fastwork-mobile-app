import 'package:flutter/material.dart';

/// Lists the service categories available on FastWork.
class ServicesPage extends StatelessWidget {
  const ServicesPage({super.key});

  static const _services = [
    (Icons.build, 'Gasfiter', 'Reparación de cañerías y fugas'),
    (Icons.flash_on, 'Electricista', 'Instalaciones y averías eléctricas'),
    (Icons.vpn_key, 'Cerrajero', 'Aperturas y cambio de cerraduras'),
    (Icons.water_drop, 'Fontanero', 'Baños, cocinas y desagües'),
    (Icons.cleaning_services, 'Limpieza', 'Limpieza de hogar y oficinas'),
    (Icons.handyman, 'Multiservicio', 'Pequeñas reparaciones del hogar'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0A3D62),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            const Text(
              'Servicios',
              style: TextStyle(color: Colors.yellow, fontSize: 28, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            for (final (icon, title, subtitle) in _services)
              Card(
                color: Colors.white12,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                child: ListTile(
                  leading: Icon(icon, color: Colors.yellow[700]),
                  title: Text(title, style: const TextStyle(color: Colors.white)),
                  subtitle: Text(subtitle, style: const TextStyle(color: Colors.white70)),
                  trailing: const Icon(Icons.chevron_right, color: Colors.white70),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
