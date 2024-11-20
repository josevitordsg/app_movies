import 'package:app_movies/screens/informations.dart';
import 'package:flutter/material.dart';

class Maindrawer extends StatelessWidget {
  const Maindrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
          child: ListView(
            padding: EdgeInsets.only(top: 45),
            children: [
              ListTile(
                leading: Icon(Icons.info),
                title: Text(
                  "Informations",
                  style: TextStyle(
                    fontSize: 17
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
      );
  }
}