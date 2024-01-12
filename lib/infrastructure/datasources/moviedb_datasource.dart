import 'package:dio/dio.dart';

import 'package:cinemateca/infrastructure/models/mapper/movie_mapper.dart';
import 'package:cinemateca/infrastructure/models/moviedb/moviedb_response.dart';
// import 'package:cinemateca/services/api/base_service.dart';
import 'package:cinemateca/config/constans/enviroment.dart';
import 'package:cinemateca/domain/datasources/movies_datasource.dart';
import 'package:cinemateca/domain/entities/movie.dart';

class MoviedbDatasource extends MoviesDatasource {
  final dio = Dio(BaseOptions(
      baseUrl: 'https://api.themoviedb.org/3',
      queryParameters: {
        "api_key": Environment.theMovieDbkey,
        "lenguage": 'es-MX'
      }));
  //

  List<Movie> _jsonToMovies(Map<String, dynamic> json) {
    final movieDBResponse = MovieDbResponse.fromJson(json);

    final List<Movie> movies = movieDBResponse.results
        .where((moviedb) => moviedb.posterPath != 'no-poster')
        .map((moviedb) => MovieMapper.movieDBtoEntity(moviedb))
        .toList();
    //
    return movies;
  }

  @override
  Future<List<Movie>> getNowPlaying({int page = 1}) async {
    final response = await dio.get('/movie/now_playing', queryParameters: {
      'page': page,
    });
    return _jsonToMovies(response.data);
    // final movieDBResponse = MovieDbResponse.fromJson(response.data);

    // final List<Movie> movies = movieDBResponse.results
    //     .where((moviedb) => moviedb.posterPath != 'no-poster')
    //     .map((moviedb) => MovieMapper.movieDBtoEntity(moviedb))
    //     .toList();

    // if (response.statusCode == 200) {
    //   return Movie.fromJsonList(response.data['results']);
    //   } else {
    //     throw Exception('Error ${response.statusCode}');

    // return movies;
  }

  @override
  Future<List<Movie>> getPopular({int page = 1}) async {
    final response = await dio.get('/movie/popular', queryParameters: {
      'page': page,
    });
    return _jsonToMovies(response.data);
  }

  @override
  Future<List<Movie>> getTopRated({int page = 1}) async {
    final response = await dio.get('/movie/top_rated', queryParameters: {
      'page': page,
    });
    return _jsonToMovies(response.data);
  }

  @override
  Future<List<Movie>> getUpcoming({int page = 1}) async {
    final response = await dio.get('/movie/upcoming', queryParameters: {
      'page': page,
    });
    return _jsonToMovies(response.data);
  }
}
