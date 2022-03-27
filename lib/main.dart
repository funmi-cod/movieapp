import 'package:flutter/material.dart';
<<<<<<< HEAD
import 'package:movieapp/home/navigation.dart';
import 'package:movieapp/routes.dart';



=======
import 'package:movieapp/home/home_page.dart';
//import 'package:movieapp/login/login_screen.dart';
import 'package:movieapp/routes.dart';


>>>>>>> 05b53130005a2696f02749b48478b846a35509d6
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Movie App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      //home: SignInScreen(),
      // we ues routeName so that we don't need to remember the name
<<<<<<< HEAD
      initialRoute: NavigationScreen.routeName,
=======
      initialRoute: HomePage.routeName,
>>>>>>> 05b53130005a2696f02749b48478b846a35509d6
      routes: routes,
    );
  }
}

