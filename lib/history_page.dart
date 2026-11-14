import 'package:flutter/material.dart';

class HistoryPage extends StatelessWidget {
  const HistoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFF0A3D62), // Fondo azul
      child: ListView(
        padding: const EdgeInsets.only(top: 60),
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            child: Text(
              "Historial",
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          _buildHistoryItem("Terminal de buses la Serena", "1 sept. · 9:11 a.m.", "CLP2,294"),
          _buildHistoryItem("Federico Arcos 485", "25 ago. · 2:03 p.m.", "CLP2,867"),
          _buildHistoryItem("Banco Falabella", "25 ago. · 12:36 p.m.", "CLP2,894"),
          _buildHistoryItem("Federico Arcos 485", "22 ago. · 4:02 p.m.", "CLP1,891"),
          _buildHistoryItem("Gregorio Cordovez 317", "22 ago. · 3:04 p.m.", "CLP2,454"),
          _buildHistoryItem("Terminal San Borja", "20 ago. · 1:25 p.m.", "CLP6,708"),
          _buildHistoryItem("Terminal San Borja", "20 ago. · 1:18 p.m.", "CLP0 · Incompleto"),
        ],
      ),
    );
  }

  Widget _buildHistoryItem(String title, String date, String price) {
    return Card(
      color: Colors.white,
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      child: ListTile(
        leading: const Icon(Icons.history, size: 40, color: Color(0xFF0A3D62)),
        title: Text(
          title,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        subtitle: Text(
          date,
          style: const TextStyle(color: Colors.black54),
        ),
        trailing: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              price,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 5),
            OutlinedButton.icon(
              style: OutlinedButton.styleFrom(
                foregroundColor: Color(0xFF0A3D62),
                side: BorderSide(color: Color(0xFF0A3D62)),
              ),
              onPressed: () {},
              icon: const Icon(Icons.refresh, size: 18),
              label: const Text("Reagendar"),
            ),
          ],
        ),
      ),
    );
  }
}
