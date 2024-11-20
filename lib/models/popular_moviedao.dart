import 'actor.dart';
import 'video.dart';

class PopularMovieDao {
  String backdropPath;
  int id;
  String originalLanguage;
  String originalTitle;
  String overview;
  double popularity;
  String posterPath;
  String releaseDate;
  String title;
  double voteAverage;
  int voteCount;
  List<Actor> actors; // Lista de actores
  List<Video> videos; // Lista de videos

  PopularMovieDao({
    required this.backdropPath,
    required this.id,
    required this.originalLanguage,
    required this.originalTitle,
    required this.overview,
    required this.popularity,
    required this.posterPath,
    required this.releaseDate,
    required this.title,
    required this.voteAverage,
    required this.voteCount,
    required this.actors, // Agrega actors en el constructor
    required this.videos, // Agrega videos en el constructor
  });

  factory PopularMovieDao.fromMap(Map<String, dynamic> popular) {
    return PopularMovieDao(
      backdropPath: popular['backdrop_path'],
      id: popular['id'],
      originalLanguage: popular['original_language'],
      originalTitle: popular['original_title'],
      overview: popular['overview'],
      popularity: popular['popularity'],
      posterPath: popular['poster_path'],
      releaseDate: popular['release_date'],
      title: popular['title'],
      voteAverage: popular['vote_average'],
      voteCount: popular['vote_count'],
      actors: [], // Inicializa la lista de actores vacía
      videos: [], // Inicializa la lista de videos vacía
    );
  }
}
