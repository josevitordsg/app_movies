import 'package:app_movies/data/style_appbar.dart';
import 'package:app_movies/providers/list_all_movies.dart';

import 'package:flutter/material.dart';
import 'package:app_movies/models/movie.dart';
import 'package:app_movies/widgets/movie_card.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FilmManagement extends ConsumerStatefulWidget {
  const FilmManagement({
    super.key,
    required this.movie,
  });
  final Movie movie;

  @override
  ConsumerState<FilmManagement> createState() => _FilmManagementState();
}

class _FilmManagementState extends ConsumerState<FilmManagement> {
  bool favoriteListChanged = false;

  void _removeItem() async {
    try {
      final url = Uri.https('projetoapppobreflix-default-rtdb.firebaseio.com',
          'all-movies/${widget.movie.id}.json');

      final response = await http.delete(url);

      if (response.statusCode == 200) {
        final currentMovies = ref.read(listMovies);
        final updatedMovies = List<Movie>.from(currentMovies)..remove(widget.movie);
        ref.read(listMovies.notifier).state = updatedMovies;

        if (!context.mounted) return;

        Navigator.of(context).pop(); 
      } else {
        print('Falha ao deletar filme: ${response.body}');
      }
    } catch (error) {
      print('Erro ao deletar filme: $error');
    }
  }

  void _showDeleteConfirmationDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Confirmar Exclusão'),
          content: Text('Tem certeza de que deseja excluir este filme?'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Cancelar'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); 
                _removeItem(); 
              },
              child: Text('Excluir'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
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
          widget.movie.title,
          style: colorTextAppBar,
        )),
        actions: [
          IconButton(
            onPressed: () {
              _showDeleteConfirmationDialog();
            },
            icon: Icon(
              Icons.delete,
              color: Color.fromARGB(255, 212, 18, 4),
            ),
          )
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
          ],
        ),
      ),
    );
  }
}
