import 'package:flutter/widgets.dart';
import 'package:movieapp/home/home_page.dart';
<<<<<<< HEAD
import 'package:movieapp/home/movie_cart.dart';
import 'package:movieapp/home/navigation.dart';
=======
>>>>>>> 05b53130005a2696f02749b48478b846a35509d6
import 'package:movieapp/login/login_screen.dart';
import 'package:movieapp/sign_in/sign_in_screen.dart';

final Map<String, WidgetBuilder> routes = {
  SignInScreen.routeName: (context) => const SignInScreen(),
  LogInScreen.routeName: (context)  => const LogInScreen(),
  HomePage.routeName: (context) => const HomePage(),
<<<<<<< HEAD
  MovieCart.routeName:(context) => const MovieCart(),
  NavigationScreen.routeName:(context) => const NavigationScreen(),
=======
>>>>>>> 05b53130005a2696f02749b48478b846a35509d6
  //MovieDetails.routeName: (context) => MovieDetails(),
};