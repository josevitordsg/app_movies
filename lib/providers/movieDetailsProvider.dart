import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:app_movies/models/movie.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

final movieProvider = FutureProvider.family<Movie, String>((ref, movieId) async {
  final url = Uri.https(
    'projetoapppobreflix-default-rtdb.firebaseio.com',
    'movies/$movieId.json',
  );

  final response = await http.get(url);
  
  if (response.statusCode == 200) {
    final data = json.decode(response.body) as Map<String, dynamic>;
    return Movie(
      id: movieId,
      category: data['category'],
      title: data['title'],
      release: data['release'],
      duration: data['duration'],
      posterUrl: data['posterUrl'],
      synopsis: data['synopsis'],
      curiosity: data['curiosity'],
      sceneUrl: data['sceneUrl'],
      location: data['location'],
    );
  } else {
    throw Exception("Falha ao carregar filme");
  }
});
