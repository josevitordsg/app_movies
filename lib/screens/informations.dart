import 'package:flutter/material.dart';

class InformationsScreen extends StatelessWidget {
  const InformationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text("Informations", style: TextStyle(
              color: Color.fromARGB(255, 212, 18, 4), fontSize: 17, fontWeight: FontWeight.w800
              )
            ),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back,color: Color.fromARGB(255, 212, 18, 4),),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: const Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 15),
            Text(
              "Pobreflix is ​​the perfect streaming platform for anyone who wants enjoy good films and series without spending a fortune. Common diverse catalog that ranges from cinema classics to productions independent, Pobreflix is ​​accessible, practical and made for those who love quality entertainment.",
              style: TextStyle(
                fontSize: 18, 
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            SizedBox(height: 25),
            Text(
              "Developed by:",
              style: TextStyle(
                fontSize: 22, 
                fontWeight: FontWeight.bold,
                color: Colors.red,
              ),
            ),
            SizedBox(height: 10),
            Text(
              "José Vitor dos Santos Gomes\nThalyson Elione",
              style: TextStyle(
                fontSize: 18, 
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}