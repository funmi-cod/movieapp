import 'package:flutter/widgets.dart';
import 'package:movieapp/home/home_page.dart';
import 'package:movieapp/home/movie_cart.dart';
import 'package:movieapp/home/navigation.dart';
import 'package:movieapp/login/login_screen.dart';
import 'package:movieapp/sign_in/sign_in_screen.dart';

final Map<String, WidgetBuilder> routes = {
  SignInScreen.routeName: (context) => const SignInScreen(),
  LogInScreen.routeName: (context)  => const LogInScreen(),
  HomePage.routeName: (context) => const HomePage(),
  MovieCart.routeName:(context) => const MovieCart(),
  NavigationScreen.routeName:(context) => const NavigationScreen(),
  //MovieDetails.routeName: (context) => MovieDetails(),
};