import 'package:app_movies/screens/favorite_screen.dart';
import 'package:app_movies/utils/favorites.dart';
import 'package:app_movies/widgets/gridview_categories.dart';
import 'package:app_movies/widgets/maindrawer.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget{
  const HomeScreen ({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}
  
class _HomeScreenState extends State<HomeScreen> {
  int itemSelecionado = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
            child: Transform.translate(
              offset: Offset(-20,0),
              child: Image.asset("assets/images/logo.png"),
            ),
          ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.local_movies),
            label: 'Categorias'
            ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star),
            label: 'Favoritos'
            )
        ],
        unselectedItemColor: Colors.white,
        currentIndex: itemSelecionado,
        selectedItemColor: Colors.red,
        onTap: (index)=>{
          setState(() {
            itemSelecionado = index;
          })
        },
      ),
      drawer: const Maindrawer(),
      body: itemSelecionado == 0? GridviewCategorias(): FavoriteScreen(favoriteMovies: listFavoritesMovie)
      );
  }
}