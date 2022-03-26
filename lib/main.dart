import 'package:flutter/material.dart';
import 'package:movieapp/home/home_page.dart';
//import 'package:movieapp/login/login_screen.dart';
import 'package:movieapp/routes.dart';


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
      initialRoute: HomePage.routeName,
      routes: routes,
    );
  }
}

