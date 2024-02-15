import 'package:apiprueba/handleRequest.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

void main() async {
  // Obtener el token de manera asíncrona
  String token = await handleRequest().getToken();

  runApp(MainApp(token: token));
}

class MainApp extends StatefulWidget {
  final String token;

  const MainApp({Key? key, required this.token}) : super(key: key);

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  String song = '';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Column(
          children: [
            SearchBar(
              onChanged: (text) {
                setState(() {
                  song = text;
                });
              },
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: () => handleRequest().searchSong(song, widget.token ),
              child: const Text("Buscar"),
            ),
          ],
        ),
      ),
    );
  }
}
