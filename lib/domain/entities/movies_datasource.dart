import 'package:cinemateca/domain/entities/movie.dart';

abstract class MoviesDatasource {
  //    private let service: MovieServiceProtocol
  Future<List<Movie>> getNowPlaying({int page = 1});
}
