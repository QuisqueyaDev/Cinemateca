import 'package:cinemateca/domain/entities/movie.dart';

abstract class MoviesRepository {
  //

  //recivo las peliculas del momento
  Future<List<Movie>> getNowPlaying({int page = 1});
  //recivo las peliculas populares
  Future<List<Movie>> getPopular({int page = 1});
  //recivo las proximas peliculas
  Future<List<Movie>> getUpcoming({int page = 1});
  //recivo las peliculas con mas Rated
  Future<List<Movie>> getTopRated({int page = 1});

  //
}
