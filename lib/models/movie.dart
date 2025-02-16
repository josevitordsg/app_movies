class Movie {
  const Movie({
    required this.id,
    required this.category,
    required this.title,
    required this.release,
    required this.duration,
    required this.posterUrl,
    required this.synopsis,
    required this.curiosity,
    required this.sceneUrl,
    required this.location,
  });

  final String id;
  final String category;
  final String title;
  final String release;
  final String duration;
  final String posterUrl;
  final String synopsis;
  final String curiosity;
  final String sceneUrl;
  final String location;
}