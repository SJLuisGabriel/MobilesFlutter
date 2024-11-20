import 'package:dio/dio.dart';
import 'package:progmsn2024/models/popular_moviedao.dart';
import 'package:progmsn2024/models/actor.dart';
import 'package:progmsn2024/models/video.dart';

class PopularApi {
  final dio = Dio();

  Future<List<PopularMovieDao>> getPopularMovies() async {
    final response = await dio.get(
        'https://api.themoviedb.org/3/movie/popular?api_key=2c0e0d9712889fa2a942f20da1cb911a&language=es-MX&page=1');
    final res = response.data['results'] as List;

    List<PopularMovieDao> popularMovies = [];

    for (var popular in res) {
      // Crea el objeto PopularMovieDao
      PopularMovieDao movie = PopularMovieDao.fromMap(popular);

      // Obtén los actores para esta película
      movie.actors = await getActors(movie.id);

      // Obtén los videos (tráiler) para esta película
      movie.videos = await getTrailers(movie.id);

      popularMovies.add(movie);
    }

    return popularMovies;
  }

  Future<List<Actor>> getActors(int movieId) async {
    final response = await dio.get(
        'https://api.themoviedb.org/3/movie/$movieId/credits?api_key=2c0e0d9712889fa2a942f20da1cb911a');
    final List<dynamic> actorJson = response.data['cast'];
    return actorJson.map((json) => Actor.fromJson(json)).toList();
  }

  Future<List<Video>> getTrailers(int movieId) async {
    final response = await dio.get(
        'https://api.themoviedb.org/3/movie/$movieId/videos?api_key=2c0e0d9712889fa2a942f20da1cb911a&language=es-MX');

    final List<dynamic> videoJson = response.data['results'];
    return videoJson.map((json) => Video.fromJson(json)).toList();
  }
}
