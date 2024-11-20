import 'package:app_movies/data/app_data.dart';
import 'package:app_movies/models/category.dart';
import 'package:flutter/material.dart';

class TelaInicial extends StatefulWidget{
  const TelaInicial ({super.key});

  @override
  State<TelaInicial> createState() => _TelaInicialState();
}
  
class _TelaInicialState extends State<TelaInicial> {
  int itemSelecionado = 0;
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
        child: Padding(
          padding: EdgeInsets.only(left: 15, top: 20),
          child: ListTile(
            leading: Icon(Icons.info),
            title: Text("Informações"),
          ),
        ),
      ),
      body: GridView(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2
        ),
        children: [  
          for(Category categoria in moviesCategories)
            InkWell(
              onTap: () {},
              splashColor: Theme.of(context).primaryColor,
              borderRadius: BorderRadius.circular(16),
              child: Card(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Expanded(
                      child: Image.asset(
                        'assets/images/interestelar.jpeg',
                        fit: BoxFit.cover,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        categoria.title,
                        style: TextStyle(fontSize: 16, color: Colors.white),
                      ),
                    ),
                  ],
                ),
              )
            )
        ],
      ),
    );
  }
}
