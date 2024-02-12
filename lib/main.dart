import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  @override
  Widget build(BuildContext context) {
    var song = 'song';
    return  MaterialApp(
      home: Scaffold(
        body:Column(
          children: [
            SearchBar(
              onChanged: (text) {
                  setState(() {
                    song = text;
                    print(song);
                  });
                },
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              setState((){
                song
            })
            )
          ],
        )
      ),
    );
  }
}
