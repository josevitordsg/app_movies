import 'package:app_movies/screens/add_movies.dart';
import 'package:app_movies/screens/main_screen.dart';
import 'package:app_movies/screens/home_screen.dart';
import 'package:app_movies/screens/create_account_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
final theme = ThemeData(
  useMaterial3: true,
  bottomAppBarTheme: const BottomAppBarTheme(
    color: Color.fromARGB(50, 30, 30, 30),
    shadowColor: Colors.black
  ),
  colorScheme: ColorScheme.fromSeed(
    brightness: Brightness.dark,
    seedColor: const Color.fromARGB(50, 30, 30, 30)
  ),
  fontFamily: 'Helvetica'
);

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(
    ProviderScope(
      child: const MyApp()
    )
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: theme,
      initialRoute: '/',
      routes: {
        '/': (ctx)=> const MainScreen(),
        '/browse': (ctx)=> const HomeScreen(),
        '/create-account': (ctx)=> const CreateAccount(),
      }
      ,
    );
  }
}