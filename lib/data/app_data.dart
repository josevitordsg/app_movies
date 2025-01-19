import 'package:app_movies/models/category.dart';
import 'package:app_movies/models/movie.dart';

const moviesCategories = [
  Category(
    id: 'c1',
    title: 'Action',
    image: 'assets/images/acao.jpeg'
  ),
  Category(
    id: 'c2',
    title: 'Comedy',
    image: 'assets/images/comedia.jpeg'
  ),
  Category(
    id: 'c3',
    title: 'Horror',
    image: 'assets/images/terror.jpeg'
  ),
  Category(
    id: 'c4',
    title: 'Sci-Fi',
    image: 'assets/images/interestelar.jpeg'
  ),
];

/*const movies = [
  Movie(
    id: 'm1',
    category: 'c1',
    title: 'Baby Driver',
    release: '2017',
    duration: '113',
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
    duration: '101',
    posterUrl: 'https://a.ltrbxd.com/resized/film-poster/1/7/2/0/7/6/172076-john-wick-0-1000-0-1500-crop.jpg?v=e3c8c69b11',
    synopsis: 
      'An ex-hitman comes out of retirement to track down the gangsters that took everything from him.',
  ),
  Movie(
    id: 'm3',
    category: 'c1',
    title: 'Mission: Impossible',
    release: '1996',
    duration: '110',
    posterUrl: 'https://a.ltrbxd.com/resized/film-poster/5/1/2/0/6/51206-mission-impossible-0-1000-0-1500-crop.jpg?v=7b7690e145',
    synopsis: 
      'An American agent under false suspicion of disloyalty must discover and expose the real spy without the help of his organization.',
  ),
  Movie(
    id: 'm4',
    category: 'c1',
    title: 'The Fast and the Furious: Tokyo Drift',
    release: '2006',
    duration: '104',   posterUrl: 'https://a.ltrbxd.com/resized/film-poster/4/6/9/8/6/46986-the-fast-and-the-furious-tokyo-drift-0-1000-0-1500-crop.jpg?v=d90305bf54',
    synopsis: 
      'A teenager becomes a major competitor in the world of drift racing after moving in with his father in Tokyo.',
  ),
  Movie(
    id: 'm5',
    category: 'c2',
    title: 'Superbad',
    release: '2007',
    duration: '113',
    posterUrl: 'https://a.ltrbxd.com/resized/film-poster/4/7/7/7/6/47776-superbad-0-1000-0-1500-crop.jpg?v=b43686efcb',
    synopsis: 
      'Two high school friends attempt to buy alcohol for a party in order to impress girls, leading to a chaotic night.',
  ),
  Movie(
    id: 'm6',
    category: 'c2',
    title: 'White Chicks',
    release: '2004',
    duration: '109',
    posterUrl: 'https://a.ltrbxd.com/resized/film-poster/4/4/7/5/0/44750-white-chicks-0-1000-0-1500-crop.jpg?v=bfa48588cf',
    synopsis: 
      'Two disgraced FBI agents go undercover as white women to solve a kidnapping plot.',
  ),
  Movie(
    id: 'm7',
    category: 'c2',
    title: 'Grown Ups',
    release: '2010',
    duration: '102',
    posterUrl: 'https://a.ltrbxd.com/resized/film-poster/2/6/1/9/6/26196-grown-ups-0-1000-0-1500-crop.jpg?v=214c173d2a',
    synopsis: 
      'Five childhood friends reunite for a 4th of July holiday weekend after their basketball coach dies.',
  ),
  Movie(
    id: 'm8',
    category: 'c3',
    title: 'Halloween',
    release: '1978',
    duration: '91',
    posterUrl: 'https://a.ltrbxd.com/resized/film-poster/6/0/2/9/8/60298-halloween-0-1000-0-1500-crop.jpg?v=bcb3149dda',
    synopsis: 
      'Fifteen years after murdering his sister on Halloween night, Michael Myers escapes from a mental hospital and returns to his hometown.',
  ),
  Movie(
    id: 'm9',
    category: 'c3',
    title: 'It',
    release: '2017',
    duration: '135',
    posterUrl: 'https://a.ltrbxd.com/resized/sm/upload/w3/47/76/am/6uDpMsdn8bbZScDptbika5JEtSH-0-1000-0-1500-crop.jpg?v=ee603d8e3b',
    synopsis: 
      'A group of bullied kids band together to destroy a shape-shifting monster that disguises itself as a clown and preys on children.',
  ),
  Movie(
    id: 'm1',
    category: 'c4',
    title: 'Interstellar',
    release: '2014',
    duration: '169',
    posterUrl:
      'https://a.ltrbxd.com/resized/film-poster/1/1/7/6/2/1/117621-interstellar-0-1000-0-1500-crop.jpg?v=7ad89e6666',
    synopsis: 
      'A team of explorers travel through a wormhole in space in an attempt to ensure humanity\'s survival.'
  ),
  Movie{
    id: 'm2'
    category:"c4"
    duration:"148"
    imageUrl:"https://a.ltrbxd.com/resized/sm/upload/sv/95/s9/4j/inception-0-1000-0-1500-crop.jpg?v=30d7224316"
    release: "2010"
    synopsis:"A thief who enters the dreams of others to steal secrets from their subconscious is given the invers"
    title:"Inception"
  },
  Movie(
    id: 'm3',
    category: 'c4',
    title: 'The Matrix',
    release: '1999',
    duration: '136',
    posterUrl:
      'https://a.ltrbxd.com/resized/film-poster/5/1/5/1/8/51518-the-matrix-0-1000-0-1500-crop.jpg?v=fc7c366afe', 
    synopsis: 
      'A computer hacker learns from mysterious rebels about the true nature of his reality and his role in the war against its controllers.'
  ),
   Movie(
    id: 'm4',
    category: 'c4',
    title: 'The Martian',
    release: '2015',
    duration: '144',
    posterUrl:
      'https://a.ltrbxd.com/resized/film-poster/2/6/5/4/3/9/265439-blade-runner-2049-0-1000-0-1500-crop.jpg?v=86735e0bb8', 
    synopsis: 
      'An astronaut becomes stranded on Mars after his team assumes he is dead, and must figure out how to survive on the hostile planet.'
  )
];
*/
