import 'package:app_movies/models/movie.dart';
import 'package:app_movies/utils/create_appbar.dart';
import 'package:app_movies/utils/favorites.dart';
import 'package:app_movies/widgets/movie_card.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
class AllMovies extends StatefulWidget {
  const AllMovies({super.key});

  @override
  State<AllMovies> createState() => _AllMoviesState();
}

class _AllMoviesState extends State<AllMovies> {
  List<Movie> movies = [];
  bool isLoading = true;
  @override
  void initState(){
    super.initState();
    loadItems();
  }

  void loadItems() async{
    setState(() {
      isLoading = true;
    });
   try {
      final url = Uri.https('projetoapppobreflix-default-rtdb.firebaseio.com', 'all-movies.json');
      final response = await http.get(url);

      if (response.statusCode == 200) {
        final Map<String, dynamic> listData = json.decode(response.body);
        final List<Movie> loadedItems = [];

        for (final item in listData.entries) {
          loadedItems.add(
            Movie(
              id: item.key,
              category: item.value['category'],
              title: item.value['title'],
              release: item.value['release'],
              duration: item.value['duration'],
              posterUrl: item.value['imageUrl'],
              synopsis: item.value['synopsis'],
            ),
          );
        }
        setState(() {
          movies = loadedItems;
        });
      } else {
        throw Exception('Failed to load movies');
      }
    } catch (error) {
      print('Erro ao carregar filmes: $error');
    } finally {
      setState(() {
        isLoading = false; 
      });
    }
  }
  @override
  Widget build(BuildContext context) {
     Widget content;
     if(isLoading){
      content = Center(child: CircularProgressIndicator(),);
     }else if(movies.isEmpty){
      content= Center(child:
        Text(
          'No Movies available',
          style: Theme.of(context)
          .textTheme.bodyLarge!.copyWith(
            color:Theme.of(context)
            .colorScheme.onSurface
          ),
          textAlign: TextAlign.center,
        )

      );
     }else{
      content = ListView.builder(
                      itemCount: movies.length,
                      itemBuilder: (context,index) => GestureDetector(
                        onTap: (){
                        },
                        child: MovieCard(movie: movies[index])
                      ),
      );
     }
    return Scaffold(
      appBar: createAppBar(context, 'Film Management'),
      body: content,
    );
  }
}