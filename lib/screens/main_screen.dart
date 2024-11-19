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
        title: Center(
            child: Image.asset("assets/images/logo.png"),
          ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.black87,
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
        child: Padding(
          padding: EdgeInsets.only(left: 15, top: 20),
          child: ListTile(
            leading: Icon(Icons.info),
            title: Text("Informações"),
          ),
        ),
      ),
    );
  }
}
