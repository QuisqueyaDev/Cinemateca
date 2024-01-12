import 'package:flutter/material.dart';
import 'package:animate_do/animate_do.dart';
import 'package:card_swiper/card_swiper.dart';
import 'package:cinemateca/domain/entities/movie.dart';

class MoviesSlideShow extends StatelessWidget {
  final List<Movie> movies;
  //
  const MoviesSlideShow({
    super.key,
    required this.movies,
  });

  @override
  Widget build(BuildContext context) {
    //color del tema por defecto
    final colors = Theme.of(context).colorScheme;
    return SizedBox(
      height: 230, width: double.infinity,
      child: Swiper(
        // transformer: ScaleAndFadeTransformer(scale: 5, fade: 1.5),

        viewportFraction: 0.8,
        scale: 0.9,
        duration: 500,
        pagination: SwiperPagination(
          margin: const EdgeInsets.only(top: 0),
          builder: DotSwiperPaginationBuilder(
            activeColor: colors.primary,
            color: colors.secondary,
          ),
        ),
        autoplay: true,
        itemCount: movies.length,
        itemBuilder: (context, index) => _Slide(movie: movies[index]),
      ), // _MoviesCarousel(),
    );
  }
}

class _Slide extends StatelessWidget {
  final Movie movie;
  const _Slide({required this.movie});

  @override
  Widget build(BuildContext context) {
    // decoracion de la sombra del cuadro
    final decoration = BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        boxShadow: const [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 10,
            offset: Offset(0, 10),
          )
        ]);

    return Padding(
      padding: const EdgeInsets.only(bottom: 30),
      child: DecoratedBox(
        decoration: decoration,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Image.network(
            movie.backdropPath,
            fit: BoxFit.cover,
            loadingBuilder: (context, child, loadingProgress) {
              if (loadingProgress != null) {
                return const DecoratedBox(
                  decoration: BoxDecoration(color: Colors.black12),
                );
              }

              return FadeIn(child: child);
            },
          ),
        ),
      ),
    );
  }
}
