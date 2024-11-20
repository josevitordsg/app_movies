import 'package:app_movies/data/style_appbar.dart';
import 'package:flutter/material.dart';
import 'package:app_movies/models/movie.dart';
import 'package:app_movies/widgets/movie_card.dart';

class MovieDetails extends StatefulWidget {
  const MovieDetails({
    super.key,
    required this.title,
    required this.movie,
    required this.onToggleFavorite,
  });

  final String title;
  final Movie movie;
  final void Function (Movie movie) onToggleFavorite;

  @override
  State<MovieDetails> createState() => _MovieDetailsState();
}

class _MovieDetailsState extends State<MovieDetails> {
  bool isfavorite = false;
  
  @override
  Widget build(BuildContext context) {
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
              widget.onToggleFavorite(widget.movie);
              setState(() {
                isfavorite = !isfavorite;
              });
            },
            icon: Icon(isfavorite? Icons.star: Icons.star_border, color: isfavorite? Colors.yellow: Colors.grey,)
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