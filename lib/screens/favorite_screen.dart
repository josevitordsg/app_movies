import 'package:app_movies/models/movie.dart';
import 'package:app_movies/providers/listFavoriteMovies.dart';
import 'package:app_movies/screens/movie_details.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:app_movies/widgets/movie_card.dart';
import 'package:flutter/material.dart';



class FavoriteScreen extends ConsumerStatefulWidget {
  const FavoriteScreen({
    super.key,
  });
  @override
  ConsumerState<FavoriteScreen> createState() => _FavoriteScreenState();
}
class _FavoriteScreenState extends ConsumerState<FavoriteScreen> {
  
  @override
  Widget build(BuildContext context) {
    List<Movie> listFavoriteMovies = ref.watch(listFavoritesMovie);
    Widget content = listFavoriteMovies.isNotEmpty
                    ? ListView.builder(
                      itemCount: listFavoriteMovies.length,
                      itemBuilder: (context,index) => GestureDetector(
                        onTap: (){
                          Navigator.push(
                            context, 
                            MaterialPageRoute(
                              builder:(context)=>MovieDetails(
                                movie: listFavoriteMovies[index], 
                                title: listFavoriteMovies[index].title) 
                            )
                          );
                        },
                        child: MovieCard(movie: listFavoriteMovies[index])
                      ),
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