import 'package:flutter/material.dart';
import 'package:apiprueba/handleRequest.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  var song = 'song'; // Variable para almacenar el texto de la búsqueda

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Column(
          children: [
            SearchBar(
              onChanged: (text) {
                setState(() {
                  song = text; // Actualizar el valor de la búsqueda
                  print(song);
                });
              },
            ),
            SizedBox(
              height: 20,
            ),
            Text(song),
            ElevatedButton(onPressed: handleRequest().searchSong(), child: Text("Buscar")) // Usar el valor actualizado en el Text widget
          ],
        ),
      ),
    );
  }
}

class SearchBar extends StatelessWidget {
  final ValueChanged<String>? onChanged;

  const SearchBar({Key? key, this.onChanged}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: onChanged,
      decoration: InputDecoration(
        hintText: 'Ingrese su búsqueda',
      ),
    );
  }
}

