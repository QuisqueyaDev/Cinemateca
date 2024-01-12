import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:cinemateca/presentation/providers/movies/movies_provider.dart';
import 'package:cinemateca/domain/entities/movie.dart';

final moviesSlideshowProvider = Provider<List<Movie>>((ref) {
  //
  final nowPlayingMovies = ref.watch(nowPlayingMoviesProvider);
//
  if (nowPlayingMovies.isEmpty) return [];
  //
  return nowPlayingMovies.sublist(0, 6);
});
