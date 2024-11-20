import 'package:flutter/material.dart';
import 'package:app_movies/models/movie.dart';
import 'package:app_movies/widgets/movie_card.dart';

class MovieDetails extends StatelessWidget {
  const MovieDetails({
    super.key,
    required this.title,
    required this.movie,
  });

  final String title;
  final Movie movie;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(movie.title),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.star)
          ),
        ],
      ),
      body: Center(
        child: Column(
          children: [
            MovieCard(movie: movie),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 11.0),
              child: Text(
                movie.synopsis,
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
                padding: EdgeInsets.symmetric(vertical: 20, horizontal: 140),
              ),
              onPressed: () {}, 
              child: Text('Watch',style: TextStyle(fontSize: 15, color: Colors.white),)
            )
          ],
        ),
      ),
    );
  }
}