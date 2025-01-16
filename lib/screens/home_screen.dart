import 'package:app_movies/screens/add_movies.dart';
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
  int selectedItem = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
            child: Transform.translate(
              offset: const Offset(-20,0),
              child: Image.asset("assets/images/logo.png"),
            ),
          ),
            actions: [
              IconButton(
                onPressed: (){
                  Navigator.push(context, MaterialPageRoute(
                    builder: (context)=>
                    AddMovies()
                  )
                );
                }, 
                icon: Icon(Icons.add)
              )
              
            ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.local_movies),
            label: 'Categories'
            ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star),
            label: 'Favorites'
            )
        ],
        unselectedItemColor: Colors.white,
        currentIndex: selectedItem,
        selectedItemColor: Colors.red,
        onTap: (index)=>{
          setState(() {
            selectedItem = index;
          })
        },
      ),
      drawer: const Maindrawer(),
      body: selectedItem == 0? const GridviewCategories(): FavoriteScreen()
      );
  }
}