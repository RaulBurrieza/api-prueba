import 'dart:convert';
import 'dart:io';
import 'package:apiprueba/models/song.dart';
import 'package:http/http.dart' as http;
class handleRequest {

final client_id = "8f014b27dd6542d1a3344be72948fdb7";
final client_secret = "11f44aab63654684b1551c5220f2bf01";

///////////Metodo para generar un token y poder realizar peticiones a la API/////////////////

Future<String> getToken() async {
  var response = await http.post(
    Uri.parse('https://accounts.spotify.com/api/token'),
    headers: <String, String>{
      'Content-Type': 'application/x-www-form-urlencoded'
    },
    body: {
      'grant_type': 'client_credentials',
      'client_id': '8f014b27dd6542d1a3344be72948fdb7',
      'client_secret': '11f44aab63654684b1551c5220f2bf01',
    },
  );
  print(response.body);
  Map<String, dynamic> responseData = jsonDecode(response.body);
  String token = responseData['access_token'];
  print(token);
  return token;
}


////////////Metodo para buscar una cancion en especifico/////////////////

Future<String> searchSong(String song, String access_token) async {
    try {
      final uri = "https://api.spotify.com/v1/search?q=" + song + "&type=track&limit=1";
      print(uri);
      print(access_token);
      var header = {"Authorization": "Bearer " + access_token};
      var response = await http.get(Uri.parse(uri), headers: header);
      print(response.body);
      return response.body;
    }catch (error) {
      return error.toString();}
}



}



