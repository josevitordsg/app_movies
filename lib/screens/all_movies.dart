import 'package:app_movies/data/style_appbar.dart';
import 'package:app_movies/models/movie.dart';
import 'package:app_movies/providers/list_all_movies.dart';
import 'package:app_movies/screens/add_movies.dart';
import 'package:app_movies/screens/film_management.dart';
import 'package:app_movies/utils/create_appbar.dart';

import 'package:app_movies/widgets/movie_card.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter_riverpod/flutter_riverpod.dart';
class AllMovies extends ConsumerStatefulWidget {
  const AllMovies({super.key});

  @override
  ConsumerState<AllMovies> createState() => _AllMoviesState();
}

class _AllMoviesState extends ConsumerState<AllMovies> {
  bool isLoading = true;  

  @override
  void initState() {
    super.initState();
    if (ref.read(listMovies).isEmpty) {
      ref.read(listMovies.notifier).loadMovies();
        isLoading =false;
    }else{
      setState(() {
        isLoading = false;
      });
    }
  }
  @override
  Widget build(BuildContext context) {
    final movies = ref.watch(listMovies);

    Widget content;

    if (isLoading) {
      content = Center(child: CircularProgressIndicator()); 
    } else if (movies.isEmpty) {
      content = Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'No movies available', 
              style: Theme.of(context)
                .textTheme.bodyLarge!.copyWith(
                  color: Theme.of(context)
                  .colorScheme.onSurface
                ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      );
    } else {
      content = ListView.builder(
        itemCount: movies.length,
        itemBuilder: (context, index) => GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => FilmManagement(
                  movie: movies[index],
                ),
              ),
            );
          },
          child: MovieCard(movie: movies[index]),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: iconAppBar,
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Center(
            child: Text(
          "Film Management",
          style: colorTextAppBar,
        )),
        actions: [
         IconButton(
                onPressed: (){
                  Navigator.push(context, MaterialPageRoute(
                    builder: (context)=>
                    AddMovies()
                  )
                  );
                }, 
                icon: Icon(
                  Icons.add, 
                  color: Color.fromARGB(255, 212, 18, 4),
                )
              )
        ],
      ),
      body: content,
    );
  }
}
