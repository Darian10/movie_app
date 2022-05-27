final String imageUrlMedium = "https://image.tmdb.org/t/p/w300";
final String imageUrlLarge = "https://image.tmdb.org/t/p/w500";

String getMediumPictureUrl(String path) {
  return imageUrlMedium + path;
}

String getLargePictureUrl(String path) {
  return imageUrlLarge + path;
}

Map<int, String> genreMap = {
  28: "Accion",
  12: "Aventura",
  16: "Animacion",
  35: "Comedia",
  80: "Crimen",
  99: "Documental",
  18: "Drama",
  10751: "Familia",
  14: "Fantasia",
  36: "Historia",
  27: "Terror",
  10402: "Musica",
  9648: "Misterio",
  10749: "Romance",
  878: "Ciencia Ficcion",
  10770: "pelicula de la tv",
  53: "Suspenso",
  10752: "Guerra",
  37: "Oeste",
  10759: "Accion & Aventura",
  10762: "Infantil",
  10763: "Noticias",
  10764: "Realities",
  10765: "Sci-Fi & Fantasia",
  10766: "Serial",
  10767: "Conversacion",
  10768: "Guerra & Politica"
};

List<String?> genresToList(List<dynamic> genreIds) =>
    genreIds.map((id) => genreMap[id]).toList();

String getGenreValues(List<dynamic> genreIds) {
  StringBuffer buffer = new StringBuffer();
  buffer.writeAll(genresToList(genreIds), ", ");
  return buffer.toString();
}
