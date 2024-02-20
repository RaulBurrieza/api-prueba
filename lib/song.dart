class Song {
String song_id,song_name,song_image_url,song_artist,song_album,song_genre;

Song(this.song_id,this.song_name,this.song_image_url,this.song_artist,this.song_album,this.song_genre);

Song.fromJson(Map<String, dynamic> json)
      : song_id = json['song_id'] as String,
        song_name = json['song_name'] as String,
        song_image_url =json['song_image_url'] as String,
        song_artist = json['song_artist'] as String,
        song_album =json['song_album'] as String,
        song_genre = json['song_genre'] as String;     
}