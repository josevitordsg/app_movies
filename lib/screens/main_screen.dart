import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget{
  const MainScreen ({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    int itemSelecionado = 0;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pobreflix')
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.black87,
        unselectedItemColor: Colors.white,
        selectedItemColor: Colors.red,
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
        currentIndex: itemSelecionado,
        onTap: (index)=>{
          setState(() {
            itemSelecionado = index;
          })
        },

      )

    );
  }
}
