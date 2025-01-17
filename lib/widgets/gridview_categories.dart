import 'package:app_movies/data/app_data.dart';
import 'package:app_movies/models/category.dart';
import 'package:app_movies/models/movie.dart';
import 'package:app_movies/providers/list_all_movies.dart';
import 'package:app_movies/screens/movies.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
class GridviewCategories extends ConsumerWidget {
  const GridviewCategories({super.key});
  
  List<Movie> moviesbycategory(List<Movie> movies,String idCategorie){
  List<Movie> moviesList = [];
    for(int i = 0; i< movies.length; i++){
      if(movies[i].category == idCategorie){
        moviesList.add(movies[i]);
      }
    }
    return moviesList;
  }
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final movies = ref.watch(listMovies);
    return GridView(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 14),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 9,
          mainAxisSpacing: 9,
          childAspectRatio: 0.69
        ),
        children: [  
          for(Category categorie in moviesCategories)
            InkWell(
              onTap: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context)=>MoviesScreen(
                      title: categorie.title,
                      movies: moviesbycategory(movies,categorie.id),
                    )
                  )
                );
              },
              hoverColor: Colors.red.withOpacity(0.5),
              splashColor: Colors.red,
              borderRadius: BorderRadius.circular(17),
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(17)
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(17),
                  child: Stack(
                    children: [
                        Image.asset(
                          categorie.image,
                          fit:BoxFit.cover,
                          width: double.infinity,
                          height: double.infinity,
                        ),
                      Container(
                        color: Colors.black.withOpacity(0.4),
                      ),
                      Positioned(
                        bottom: 12,
                        left: 12,
                        child: Container(
                          child: Text(
                          categorie.title,
                          style: const TextStyle(fontSize: 21, color: Colors.white, fontWeight: FontWeight.w800,)
                        ) 
                      )
                      )
                    ]
                  ),
                ) 
                ),
              )
          ]
        );
  }
}