import 'package:app_movies/models/movie.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
  final listMovies = StateNotifierProvider<MovieListNotifier, List<Movie>>((ref) {
  return MovieListNotifier(ref);
});

class MovieListNotifier extends StateNotifier<List<Movie>> {
  MovieListNotifier(this.ref) : super([]);

  final Ref ref;

  Future<void> loadMovies() async {
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
        state = loadedItems;  
      } else {
        throw Exception('Failed to load movies');
      }
    } catch (error) {
      print('Erro ao carregar filmes: $error');
    }
  }
}


