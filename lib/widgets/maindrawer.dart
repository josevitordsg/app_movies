import 'package:app_movies/screens/all_movies.dart';
import 'package:app_movies/screens/informations.dart';
import 'package:flutter/material.dart';

class Maindrawer extends StatelessWidget {
  const Maindrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
          child: ListView(
            padding: const EdgeInsets.only(top: 45),
            children: [
              ListTile(
                leading: const Icon(Icons.info),
                title: const Text(
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
            ListTile(
                leading: const Icon(Icons.info),
                title: const Text(
                  "Film management",
                  style: TextStyle(
                    fontSize: 17
                  ),
                ),
                onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const AllMovies(),
                  ),
                );
              },
            ),
            ]
          ),
      );
  }
}