import 'package:flutter/material.dart';

class AccionTab extends StatelessWidget {
  const AccionTab({super.key});
  @override
  Widget build(BuildContext context) {
    return _buildLayout('https://raw.githubusercontent.com/RoldanOrtega/UII-Act-4-Tabbar/refs/heads/main/accion.JPG', "Adrenalina Pura");
  }

  Widget _buildLayout(String url, String texto) {
    return Center(child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
      Container(width: 200, height: 200, decoration: BoxDecoration(border: Border.all(color: const Color(0xFFFFC1E3), width: 3), borderRadius: BorderRadius.circular(20)),
      child: ClipRRect(borderRadius: BorderRadius.circular(17), child: Image.network(url, fit: BoxFit.cover))),
      const SizedBox(height: 25),
      Text(texto, style: const TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold)),
    ]));
  }
}
