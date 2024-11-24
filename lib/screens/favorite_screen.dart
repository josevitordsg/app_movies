import 'package:app_movies/screens/movie_details.dart';
import 'package:app_movies/utils/favorites.dart';
import 'package:app_movies/widgets/movie_card.dart';
import 'package:flutter/material.dart';



class FavoriteScreen extends StatefulWidget {
  const FavoriteScreen({
    super.key,
  });
  @override
  State<FavoriteScreen> createState() => _FavoriteScreenState();
}
class _FavoriteScreenState extends State<FavoriteScreen> {
  
  Future<void> navigateToFavoriteMovie(index) async{

    final result = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context)=> 
        MovieDetails(
        title: listFavoritesMovie[index].title, 
        movie: listFavoritesMovie[index]
        )
      )
    );
    if(result == true){
      setState((){
      });
    }
  }
  @override
  Widget build(BuildContext context) {
    Widget content = listFavoritesMovie.isNotEmpty
                    ? ListView.builder(
                      itemCount: listFavoritesMovie.length,
                      itemBuilder: (context,index) => GestureDetector(
                        onTap: (){
                          navigateToFavoriteMovie(index);
                        },
                        child: MovieCard(movie: listFavoritesMovie[index])
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