import 'dart:convert';

import 'package:apiprueba/handleRequest.dart';
import 'package:apiprueba/models/song.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

void main() async {
  // Obtencion del token de manera asincrona
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
              onPressed: () => getSongs(),
              child: const Text("Buscar"),
            ),
          ],
        ),
      ),
    );
  }


Future<void> getSongs() async {
  var response = await handleRequest().searchSong(song, widget.token);
  print("Data received: $response");
  var data = jsonDecode(response.body);
  Song track = Song.fromJson(data);
  print("La cancion es : ");  
  track.printInfo();
}
}