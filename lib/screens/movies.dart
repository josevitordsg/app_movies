import 'package:flutter/material.dart';
import 'package:app_movies/models/movie.dart';
import 'package:app_movies/widgets/movie_card.dart';
import 'package:app_movies/screens/movie_details.dart';

class MoviesScreen extends StatelessWidget {
  const MoviesScreen({
    super.key,
    required this.title,
    required this.movies,
  });

  final String title;
  final List<Movie> movies;

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
                    movie: movies[index]),
                ),
              );
            },
            child: MovieCard(movie: movies[index]),
          );
        },
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: content
    );
  }
}