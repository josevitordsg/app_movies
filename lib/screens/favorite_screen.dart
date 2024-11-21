import 'package:app_movies/models/movie.dart';
import 'package:app_movies/widgets/movie_card.dart';
import 'package:flutter/material.dart';



class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({
    super.key,
    required this.favoriteMovies
  });
  final List<Movie>favoriteMovies;

  @override
  Widget build(BuildContext context) {
    Widget content = favoriteMovies.isNotEmpty
                    ? ListView.builder(
                      itemCount: favoriteMovies.length,
                      itemBuilder: (context,index) => MovieCard(movie: favoriteMovies[index]),
                    )
                    : Center(
                        child: 
                            Text(
                              'No favorite movies yet.',
                              style: Theme.of(context)
                              .textTheme.bodyLarge!.copyWith(
                                color:Theme.of(context)
                                .colorScheme.onSurface
                              ),
                              textAlign: TextAlign.center,
                            )
                      );
    return Scaffold(
      body: content,
    );
  }
}