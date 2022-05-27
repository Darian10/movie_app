import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;

import 'constants.dart';
import 'package:movie_app/model/media.dart';

class HttpHandler {
  late final String mediaType;
  late final String video;

  HttpHandler(this.video, this.mediaType);

  final String baseURL = "api.themoviedb.org";
  final String lang = "es-ES";

  Future<dynamic> getJson(Uri uri) async {
    var client = http.Client();
    try {
      var res = await client.get(uri);
      return json.decode(res.body);
    } finally {
      client.close();
    }
  }

  Future<List<Media>> fetchMovies() {
    var uri = Uri.https(baseURL, getUnEncodePath(video, mediaType),
        {'api_key': API_KEY, 'page': "1", 'language': lang});

    return getJson(uri).then(((data) {
      return data['results'].map<Media>((item) => Media(video, item)).toList();
    }));
  }
}

String getUnEncodePath(String video, String mediaType) {
  if (video == "Peliculas") {
    if (mediaType == "Populares") {
      return "3/movie/popular";
    } else if (mediaType == "Proximamente") {
      return "3/movie/upcoming";
    } else if (mediaType == "Mejor valoradas") {
      return "3/movie/top_rated";
    } else
      return "";
  } else if (video == "Television") {
    if (mediaType == "Populares") {
      return "3/tv/popular";
    } else if (mediaType == "Proximamente") {
      return "3/tv/airing_today";
    } else if (mediaType == "Mejor valoradas") {
      return "3/tv/top_rated";
    } else
      return "";
  } else
    return "";
}
