import 'package:movie_app/common/util.dart';

class Media {
  late int id;
  late double voteAverage;
  late String title;
  late String posterPath;
  late String backdropPath;
  late String overview;
  late List<dynamic> genreIds;

  factory Media(String video, Map jsonMap) {
    try {
      if (video == "Peliculas")
        return Media.deserializeMovie(jsonMap);
      else {
        return Media.deserializeTv(jsonMap);
      }
    } catch (ex) {
      throw ex;
    }
  }

  String getPosterUrl() => getMediumPictureUrl(posterPath);
  String getBackDropUrl() => getLargePictureUrl(posterPath);
  String getGenres() => getGenreValues(genreIds);

  Media.deserializeMovie(Map json)
      : id = json["id"].toInt(),
        voteAverage = json["vote_average"].toDouble(),
        title = json["title"],
        posterPath = json["poster_path"] ?? "",
        backdropPath = json["backdrop_path"] ?? "",
        overview = json["overview"],
        genreIds = json["genre_ids"].toList();

  Media.deserializeTv(Map json)
      : id = json["id"].toInt(),
        voteAverage = json["vote_average"].toDouble(),
        title = json["name"],
        posterPath = json["poster_path"] ?? "",
        backdropPath = json["backdrop_path"] ?? "",
        overview = json["overview"],
        genreIds = json["genre_ids"].toList();
}
