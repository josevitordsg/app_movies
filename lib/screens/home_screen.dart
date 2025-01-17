import 'package:app_movies/providers/list_all_movies.dart';
import 'package:app_movies/screens/add_movies.dart';
import 'package:app_movies/screens/favorite_screen.dart';
import 'package:app_movies/widgets/gridview_categories.dart';
import 'package:app_movies/widgets/maindrawer.dart';
import 'package:app_movies/screens/list_users.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter_riverpod/flutter_riverpod.dart';
class HomeScreen extends ConsumerStatefulWidget{
  const HomeScreen ({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}
  
class _HomeScreenState extends ConsumerState<HomeScreen> {
  int selectedItem = 0;

  @override
  void initState() {
    super.initState();
    if (ref.read(listMovies).isEmpty) {
      ref.read(listMovies.notifier).loadMovies();
    }
  }
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
              ),
              IconButton(
                onPressed: (){
                  Navigator.push(context, MaterialPageRoute(
                    builder: (context)=>
                    const ListUsers()
                  )
                );
                }, 
                icon: Icon(Icons.person)
              ),
              
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