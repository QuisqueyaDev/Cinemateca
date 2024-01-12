import 'package:animate_do/animate_do.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:cinemateca/presentation/providers/providers.dart';
import 'package:cinemateca/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  static const name = "home-screen";
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const _HomeView();
  }
}

class _HomeView extends ConsumerStatefulWidget {
  const _HomeView();

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends ConsumerState<_HomeView> {
  @override
  void initState() {
    super.initState();
    //
    ref.read(nowPlayingMoviesProvider.notifier).loadNextPage();
    //
    ref.read(popularMoviesProvider.notifier).loadNextPage();
    //
    ref.read(topRatedMoviesProvider.notifier).loadNextPage();
    //
    ref.read(upcomingMoviesProvider.notifier).loadNextPage();
  }

  //
  @override
  Widget build(BuildContext context) {
    final initialLoading = ref.watch(initialLoadProvider);
    if (initialLoading) return const FullScreenLoader();

    //definición por defecto
    final nowPlayingMovies = ref.watch(nowPlayingMoviesProvider);
    final popularMovies = ref.watch(popularMoviesProvider);
    final topRatedMovies = ref.watch(topRatedMoviesProvider);
    final upcomingMovies = ref.watch(upcomingMoviesProvider);
    //
    final slideShowMovies = ref.watch(moviesSlideshowProvider);
    return CustomScrollView(
      slivers: [
        const SliverAppBar(
          floating: true,
          flexibleSpace: FlexibleSpaceBar(
            title: CustomAppbar(),
          ),
        ),
        SliverList(
          delegate: SliverChildBuilderDelegate((context, index) {
            return Column(
              children: [
                MoviesSlideShow(movies: slideShowMovies),
                //
                // MovieHorizontalListview(movies: nowPlayingMovies),
                FadeInRight(
                  child: MovieHorizontalListview(
                      movies: nowPlayingMovies,
                      title: 'Solo en cines',
                      subTitle: 'Lunes 20',
                      loadNextPage: () {
                        ref
                            .read(nowPlayingMoviesProvider.notifier)
                            .loadNextPage();
                      }),
                ),
                FadeInRight(
                  child: MovieHorizontalListview(
                      movies: popularMovies,
                      title: 'Populares',
                      // subTitle: 'Lunes 20',
                      loadNextPage: () {
                        ref.read(popularMoviesProvider.notifier).loadNextPage();
                      }),
                ),
                FadeInRight(
                  child: MovieHorizontalListview(
                      movies: topRatedMovies,
                      title: 'Peliculas en TOP',
                      // subTitle: 'Lunes 20',
                      loadNextPage: () {
                        ref
                            .read(topRatedMoviesProvider.notifier)
                            .loadNextPage();
                      }),
                ),
                MovieHorizontalListview(
                    movies: upcomingMovies,
                    title: 'Proximamente',
                    // subTitle: 'Lunes 20',
                    loadNextPage: () {
                      ref.read(upcomingMoviesProvider.notifier).loadNextPage();
                    }),
                //
                const SizedBox(height: 10)
              ],
            );
          }),
        ),
      ],
    );
  }
}
