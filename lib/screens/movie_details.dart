import 'package:app_movies/data/style_appbar.dart';
import 'package:app_movies/providers/listFavoriteMovies.dart';
import 'package:flutter/material.dart';
import 'package:app_movies/models/movie.dart';
import 'package:app_movies/widgets/movie_card.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
class MovieDetails extends ConsumerStatefulWidget {
  const MovieDetails({
    super.key,
    required this.title,
    required this.movie,
  });

  final String title;
  final Movie movie;

  @override
  ConsumerState<MovieDetails> createState() => _MovieDetailsState();
}

class _MovieDetailsState extends ConsumerState<MovieDetails> {
  @override
  Widget build(BuildContext context) {
    List<Movie> currentFavorites = ref.watch(listFavoritesMovie);
    bool isFavorite = currentFavorites.contains(widget.movie);
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon:  iconAppBar,
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Center(
            child: Text(widget.movie.title, style: colorTextAppBar,)
          
        ),
        actions: [
          IconButton(
            onPressed: () {
              ref.read(listFavoritesMovie.notifier).update((state) {
                if (state.contains(widget.movie)) {
                  return state.where((movie) => movie != widget.movie).toList();
                } else {
                  return [...state, widget.movie];
                }
              });
            },
            icon: Icon(isFavorite? Icons.star: Icons.star_border, color: isFavorite? Colors.yellow: Colors.grey,)
          ),
        ], 
      ),
      body: Center(
        child: Column(
          children: [
            MovieCard(movie: widget.movie),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 11.0),
              child: Text(
                widget.movie.synopsis,
                style: const TextStyle(
                  fontSize: 18, 
                  color: Colors.white,
                ),
              ),
            ),
            const Spacer(),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.0)
                ),
                elevation: 6.0,
                backgroundColor: const Color.fromARGB(255, 212, 18, 4),
                padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 140),
              ),
              onPressed: () {}, 
              child: const Text('Watch',style: TextStyle(fontSize: 15, color: Colors.white),)
            ),
            const SizedBox(
              height: 18,
            )
          ],
        ),
      ),
    );
  }
}