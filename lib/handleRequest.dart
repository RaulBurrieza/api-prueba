import 'dart:convert';
import 'package:http/http.dart' as http;
class handleRequest {

final client_id = "8f014b27dd6542d1a3344be72948fdb7";
final client_secret = "11f44aab63654684b1551c5220f2bf01";


searchSong(String accesToken) async {
  final uri = Uri.https('https://api.spotify.com/v1/search?q=circles&type=track');
  var header = {"Authorization": "Bearer" + accesToken};
  var response = http.get(uri,headers: header);
  print(response);
}

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
  return token;
}
}



