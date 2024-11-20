import 'package:app_movies/utils/create_appbar.dart';
import 'package:flutter/material.dart';
import 'package:app_movies/models/movie.dart';
import 'package:app_movies/widgets/movie_card.dart';
import 'package:app_movies/screens/movie_details.dart';

class MoviesScreen extends StatelessWidget {
  const MoviesScreen({
    super.key,
    required this.title,
    required this.movies,
    required this.onToggleFavorite,
  });

  final String title;
  final List<Movie> movies;
  final void Function(Movie movie) onToggleFavorite;

  void selectMovie(BuildContext context, Movie movie) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (ctx) => MovieDetails(
          title: title, 
          movie: movie, 
          onToggleFavorite: onToggleFavorite,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {

    Widget content = Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'Nothing to show!',
            style: Theme.of(context)
            .textTheme.headlineLarge!.copyWith(
              color: Theme.of(context)
              .colorScheme.onSurface
            ),
          ),
          const SizedBox(height: 16),
          Text(
            'Try selecting a different category!',
            style: Theme.of(context)
            .textTheme.bodyLarge!.copyWith(
              color: Theme.of(context)
              .colorScheme.onSurface
            )
          ),
        ],
      )
    );

    if(movies.isNotEmpty) {
      content = ListView.builder(
        itemCount: movies.length,
        itemBuilder: (ctx, index) {
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => MovieDetails(
                    title: title,
                    movie: movies[index],
                    onToggleFavorite: onToggleFavorite,
                  ),
                ),
              );
            },
            child: MovieCard(movie: movies[index]),
          );
        },
      );
    }

    return Scaffold(
      appBar: CreateAppBar(context, title),
      body: content
    );
  }
}