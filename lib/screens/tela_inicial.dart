import 'package:app_movies/data/app_data.dart';
import 'package:app_movies/models/category.dart';
import 'package:app_movies/models/movie.dart';
import 'package:app_movies/screens/movies.dart';
import 'package:app_movies/screens/informations.dart';
import 'package:app_movies/screens/tela_favoritos.dart';
import 'package:flutter/material.dart';

class TelaInicial extends StatefulWidget{
  const TelaInicial ({super.key});

  @override
  State<TelaInicial> createState() => _TelaInicialState();
}
  
class _TelaInicialState extends State<TelaInicial> {
  int itemSelecionado = 0;

  List<Movie> FilmesporCategoria(String idCategoria){
  
  List<Movie> listaDeFilmes = [];
    for(int i = 0; i< movies.length; i++){
      if(movies[i].category == idCategoria){
        listaDeFilmes.add(movies[i]);
      }
    }
    return listaDeFilmes;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
            child: Transform.translate(
              offset: Offset(-18,0),
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
      drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.only(top: 45),
            children: [
              ListTile(
                leading: Icon(Icons.info),
                title: Text(
                  "Informations",
                  style: TextStyle(
                    fontSize: 18
                  ),
                ),
                onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const InformationsScreen(),
                  ),
                );
              },
            ),
            ]
          ),
      ),
      body: itemSelecionado == 0? GridView(
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 14),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 9,
          mainAxisSpacing: 9,
          childAspectRatio: 0.69
        ),
        children: [  
          for(Category categoria in moviesCategories)
            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context)=>MoviesScreen(title: categoria.title, movies: FilmesporCategoria(categoria.id)))
                );
              },
              hoverColor: Colors.red.withOpacity(0.5),
              splashColor: Colors.red,
              borderRadius: BorderRadius.circular(17),
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(17)
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(17),
                  child: Stack(
                    children: [
                        Image.asset(
                          categoria.imagem,
                          fit:BoxFit.cover,
                          width: double.infinity,
                          height: double.infinity,
                        ),
                      Container(
                        color: Colors.black.withOpacity(0.7),
                      ),
                      Positioned(
                        bottom: 12,
                        left: 12,
                        child: Container(
                          child: Text(
                          categoria.title,
                          style: TextStyle(fontSize: 21, color: Colors.white, fontWeight: FontWeight.w900,)
                        ) 
                      )
                      )
                    ]
                  ),
                ) 
                  
                ),
              )
          ]
        ): TelaFavoritos(favoriteMovies: [])
      );
  }
}