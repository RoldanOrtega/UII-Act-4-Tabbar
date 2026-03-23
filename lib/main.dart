import 'package:flutter/material.dart';
// Importamos las pestañas desde la carpeta mis_paginas_tab
import 'mis_paginas_tab/romance.dart';
import 'mis_paginas_tab/accion.dart';
import 'mis_paginas_tab/comedia.dart';
import 'mis_paginas_tab/suspenso.dart';
import 'mis_paginas_tab/fantasia.dart';

void main() => runApp(const LecturasApp());

class LecturasApp extends StatelessWidget {
  const LecturasApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(scaffoldBackgroundColor: const Color(0xFF121212)),
      home: const NavegacionPrincipal(),
    );
  }
}

class NavegacionPrincipal extends StatefulWidget {
  const NavegacionPrincipal({super.key});

  @override
  State<NavegacionPrincipal> createState() => _NavegacionPrincipalState();
}

class _NavegacionPrincipalState extends State<NavegacionPrincipal> {
  int _indice = 0;

  // Widget para la vista de Inicio (dentro del main)
  Widget _buildInicio() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 200, height: 200,
            decoration: BoxDecoration(
              border: Border.all(color: const Color(0xFFFFC1E3), width: 3),
              borderRadius: BorderRadius.circular(20),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(17),
              child: Image.network(
                'https://raw.githubusercontent.com/RoldanOrtega/UII-Act-4-Tabbar/refs/heads/main/inicio1.png',
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(height: 25),
          const Text(
            "Mi Biblioteca", 
            style: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold)
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    const Color rosaClaro = Color(0xFFFFC1E3);
    const Color rosaFuerte = Color(0xFFF06292);

    // Variables sin guion bajo para evitar advertencias de VS Code
    final List<Widget> listaPaginas = [
      _buildInicio(), 
      const RomanceTab(),
      const AccionTab(),
      const ComediaTab(),
      const SuspensoTab(),
      const FantasiaTab(),
    ];

    final List<String> listaTitulos = [
      "INICIO", "ROMANCE", "ACCIÓN", "COMEDIA", "SUSPENSO", "FANTASÍA"
    ];

    return Scaffold(
      appBar: AppBar(
        backgroundColor: rosaClaro,
        elevation: 0,
        centerTitle: true,
        title: Text(
          listaTitulos[_indice], 
          style: const TextStyle(color: Colors.black, fontWeight: FontWeight.bold)
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 12),
            child: CircleAvatar(
              radius: 18,
              backgroundColor: Colors.black,
              backgroundImage: const NetworkImage(
                'https://raw.githubusercontent.com/RoldanOrtega/UII-Act-4-Tabbar/refs/heads/main/papapa.JPG'
              ),
            ),
          ),
        ],
      ),
      
      body: listaPaginas[_indice],

      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: rosaClaro,
        selectedItemColor: rosaFuerte,
        unselectedItemColor: Colors.black,
        currentIndex: _indice,
        onTap: (val) => setState(() => _indice = val),
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Inicio"),
          BottomNavigationBarItem(icon: Icon(Icons.favorite), label: "Romance"),
          BottomNavigationBarItem(icon: Icon(Icons.bolt), label: "Acción"),
          BottomNavigationBarItem(icon: Icon(Icons.emoji_emotions), label: "Comedia"),
          BottomNavigationBarItem(icon: Icon(Icons.visibility), label: "Suspenso"),
          BottomNavigationBarItem(icon: Icon(Icons.auto_fix_high), label: "Fantasía"),
        ],
      ),
    );
  }
}