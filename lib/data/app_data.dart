import 'package:app_movies/models/category.dart';
import 'package:app_movies/models/movie.dart';

const moviesCategories = [
  Category(
    id: 'c1',
    title: 'Action',
  ),
  Category(
    id: 'c2',
    title: 'Comedy',
  ),
  Category(
    id: 'c3',
    title: 'Horror',
  ),
  Category(
    id: 'c4',
    title: 'Sci-Fi',
  ),
];

const movies = [
  Movie(
    id: 'm1',
    category: 'c1',
    title: 'Baby Driver',
    release: '2017',
    duration: '113 mins',
    director: 'Edgar Wright',
    posterUrl:
      'https://a.ltrbxd.com/resized/film-poster/2/6/8/9/5/0/268950-baby-driver-0-1000-0-1500-crop.jpg?v=61304ddfc8',
    synopsis: 
      'After being coerced into working for a crime boss, a young getaway driver finds himself taking part in a heist doomed to fail.'
  ),
  Movie(
    id: 'm2',
    category: 'c1',
    title: 'John Wick',
    release: '2014',
    duration: '101 mins',
    director: 'Chad Stahelski',
    posterUrl: 'https://a.ltrbxd.com/resized/film-poster/1/7/2/0/7/6/172076-john-wick-0-1000-0-1500-crop.jpg?v=e3c8c69b11',
    synopsis: 
      'An ex-hitman comes out of retirement to track down the gangsters that took everything from him.',
  ),
  Movie(
    id: 'm3',
    category: 'c1',
    title: 'Mission: Impossible',
    release: '1996',
    duration: '110 mins',
    director: 'Brian De Palma',
    posterUrl: 'https://a.ltrbxd.com/resized/film-poster/5/1/2/0/6/51206-mission-impossible-0-1000-0-1500-crop.jpg?v=7b7690e145',
    synopsis: 
      'An American agent under false suspicion of disloyalty must discover and expose the real spy without the help of his organization.',
  ),
  Movie(
    id: 'm4',
    category: 'c1',
    title: 'The Fast and the Furious: Tokyo Drift',
    release: '2006',
    duration: '104 mins',
    director: 'Justin Lin',
    posterUrl: 'https://a.ltrbxd.com/resized/film-poster/4/6/9/8/6/46986-the-fast-and-the-furious-tokyo-drift-0-1000-0-1500-crop.jpg?v=d90305bf54',
    synopsis: 
      'A teenager becomes a major competitor in the world of drift racing after moving in with his father in Tokyo.',
  ),
  Movie(
    id: 'm5',
    category: 'c2',
    title: 'Superbad',
    release: '2007',
    duration: '113 mins',
    director: 'Greg Mottola',
    posterUrl: 'https://a.ltrbxd.com/resized/film-poster/4/7/7/7/6/47776-superbad-0-1000-0-1500-crop.jpg?v=b43686efcb',
    synopsis: 
      'Two high school friends attempt to buy alcohol for a party in order to impress girls, leading to a chaotic night.',
  ),
  Movie(
    id: 'm6',
    category: 'c2',
    title: 'White Chicks',
    release: '2004',
    duration: '109 mins',
    director: 'Keenen Ivory Wayans',
    posterUrl: 'https://a.ltrbxd.com/resized/film-poster/4/4/7/5/0/44750-white-chicks-0-1000-0-1500-crop.jpg?v=bfa48588cf',
    synopsis: 
      'Two disgraced FBI agents go undercover as white women to solve a kidnapping plot.',
  ),
  Movie(
    id: 'm7',
    category: 'c2',
    title: 'Grown Ups',
    release: '2010',
    duration: '102 mins',
    director: 'Dennis Dugan',
    posterUrl: 'https://a.ltrbxd.com/resized/film-poster/2/6/1/9/6/26196-grown-ups-0-1000-0-1500-crop.jpg?v=214c173d2a',
    synopsis: 
      'Five childhood friends reunite for a 4th of July holiday weekend after their basketball coach dies.',
  ),
  Movie(
    id: 'm8',
    category: 'c3',
    title: 'Halloween',
    release: '1978',
    duration: '91 mins',
    director: 'John Carpenter',
    posterUrl: 'https://a.ltrbxd.com/resized/film-poster/6/0/2/9/8/60298-halloween-0-1000-0-1500-crop.jpg?v=bcb3149dda',
    synopsis: 
      'Fifteen years after murdering his sister on Halloween night, Michael Myers escapes from a mental hospital and returns to his hometown.',
  ),
  Movie(
    id: 'm9',
    category: 'c3',
    title: 'It',
    release: '2017',
    duration: '135 mins',
    director: 'Andy Muschietti',
    posterUrl: 'https://a.ltrbxd.com/resized/sm/upload/w3/47/76/am/6uDpMsdn8bbZScDptbika5JEtSH-0-1000-0-1500-crop.jpg?v=ee603d8e3b',
    synopsis: 
      'A group of bullied kids band together to destroy a shape-shifting monster that disguises itself as a clown and preys on children.',
  ),
  Movie(
    id: 'm10',
    category: 'c4',
    title: '',
    release: '',
    duration: '',
    director: '',
    posterUrl: '',
    synopsis: '',
  ),
];