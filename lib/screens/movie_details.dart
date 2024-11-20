import 'package:app_movies/data/app_data.dart';
import 'package:app_movies/data/style_appbar.dart';
import 'package:app_movies/utils/favorites.dart';
import 'package:flutter/material.dart';
import 'package:app_movies/models/movie.dart';
import 'package:app_movies/widgets/movie_card.dart';

class MovieDetails extends StatefulWidget {
  const MovieDetails({
    super.key,
    required this.title,
    required this.movie,
  });

  final String title;
  final Movie movie;

  @override
  State<MovieDetails> createState() => _MovieDetailsState();
}

class _MovieDetailsState extends State<MovieDetails> {
  
  @override
  Widget build(BuildContext context) {
    bool isFavorite = listFavoritesMovie.contains(widget.movie);
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
              if(listFavoritesMovie.contains(widget.movie)){
                listFavoritesMovie.remove(widget.movie);
              }else{
                listFavoritesMovie.add(widget.movie);
              }
              setState(() {
                isFavorite = !isFavorite;
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