import 'package:apiprueba/handleRequest.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  Future<String> token=handleRequest().getToken();
  @override
  Widget build(BuildContext context) {
    String song='';
    return  MaterialApp(
      home: Scaffold(
        body:Column(
          children: [
            SearchBar(
              onChanged:(text){ 
                setState(() {
                  song = text;
                });
              },
            ),
            const SizedBox(height: 30),
            ElevatedButton(onPressed: ()=>handleRequest().searchSong(song,token), child: const Text("Buscar")),
          ],
        )
      ),
    );
  }
}