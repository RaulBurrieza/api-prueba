import 'dart:convert';
import 'package:http/http.dart' as http;
class handleRequest {

final client_id = "8f014b27dd6542d1a3344be72948fdb7";
final client_secret = "11f44aab63654684b1551c5220f2bf01";


//Metodo para buscar una cancion en especifico
searchSong(String song,Future<String> access_token) async {
  print("Hola");
  final uri = 'https://api.spotify.com/v1/search?q=\$song&type=track';
  String token= access_token.toString();
  var header = {"Authorization": "Bearer " + token};
  print(header);
  var response = http.get(Uri.https(uri),headers: header);
  print(response);
}



//Metodo para generar un token y poder realizar peticiones a la API
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
}



