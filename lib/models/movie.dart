class Movie {
  Movie({
    required this.id,
    required this.category,
    required this.title,
    required this.release,
    required this.duration,
    required this.director,
    required this.posterUrl,
    required this.synopsis,
    this.isFavorite = false
  });

  final String id;
  final String category;
  final String title;
  final String release;
  final String duration;
  final String director;
  final String posterUrl;
  final String synopsis;
  bool isFavorite;
}