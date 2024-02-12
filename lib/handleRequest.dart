import 'package:http/http.dart' as http;
class handleRequest {

final accesToken = "8f014b27dd6542d1a3344be72948fdb7";
final uri = Uri.https('https://api.spotify.com/v1/search?q=circles&type=track');

searchSong()async {
  var header = {"Authorization": "Bearer" + accesToken};
  var response = http.get(uri,headers: header);
  print(response);
}
  
}