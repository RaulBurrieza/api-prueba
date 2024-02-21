class Song { String song_id,song_name,song_image_url,song_artist,song_album,song_genre;

Song({
required this.song_id,
required this.song_name,
required this.song_image_url,
required this.song_artist,
required this.song_album,
required this.song_genre});

Song.fromJson(Map<String,dynamic> json)
: song_id = json["tracks"]["items"][0]["id"] as String,
song_name = json["tracks"]["items"][0]["name"] as String,
song_image_url = json["tracks"]["items"][0]["album"]["images"][1]["url"]as String,
song_artist = json["tracks"]["items"][0]["artist"][0]["name"] as String,
song_album = json["tracks"]["items"][0]["album"]["name"] as String,
song_genre = json["tracks"]["items"][0]["album"]["name"] as String;

}



