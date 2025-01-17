import 'package:app_movies/models/movie.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final listFavoritesMovie = StateProvider<List<Movie>>((ref)=>[]);