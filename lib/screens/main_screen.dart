import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget{
  const MainScreen ({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color.fromRGBO(30, 30, 30, 50),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset("assets/images/logoPrincipal.png"),
            SizedBox(height: 20,),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.0)
                ),
                elevation: 6.0,
                backgroundColor: const Color.fromARGB(255, 212, 18, 4),
                padding: EdgeInsets.symmetric(vertical: 20, horizontal: 130),
              ),
              onPressed: (){
                Navigator.pushNamed(context,'/browse');
              }, 
              child: Text('Entrar',style: TextStyle(fontSize: 15, color: Colors.white),)
            )
          ],
        )
      ),
    );
  }
}
