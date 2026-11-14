import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0A3D62),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            const Text(
              "FASTWORK",
              style: TextStyle(
                color: Colors.yellow,
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            TextField(
              decoration: InputDecoration(
                hintText: "¿Qué servicio buscas?",
                hintStyle: const TextStyle(color: Colors.white70),
                filled: true,
                fillColor: Colors.white24,
                prefixIcon: const Icon(Icons.search, color: Colors.white70),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: BorderSide.none,
                ),
              ),
              style: const TextStyle(color: Colors.white),
            ),
            const SizedBox(height: 20),
            const Text(
              "Sugerencias",
              style: TextStyle(color: Colors.white, fontSize: 18),
            ),
            const SizedBox(height: 20),
            GridView.count(
              crossAxisCount: 2,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              crossAxisSpacing: 12,
              mainAxisSpacing: 12,
              children: const [
                _ServiceCard(icon: Icons.build, title: "Gasfiter"),
                _ServiceCard(icon: Icons.flash_on, title: "Electricista"),
                _ServiceCard(icon: Icons.vpn_key, title: "Cerrajero"),
                _ServiceCard(icon: Icons.water_drop, title: "Fontanero"),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _ServiceCard extends StatelessWidget {
  final IconData icon;
  final String title;

  const _ServiceCard({required this.icon, required this.title});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 40, color: const Color(0xFF0A3D62)),
            const SizedBox(height: 10),
            Text(title,
                style: const TextStyle(
                    color: Color(0xFF0A3D62), fontWeight: FontWeight.bold)),
          ],
        ),
      ),
    );
  }
}
