import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../components/constants.dart';
import 'home_page.dart';
import 'movie_cart.dart';

class NavigationScreen extends StatefulWidget {
  const NavigationScreen({Key? key}) : super(key: key);

  static String routeName = "/navigation";
  @override
  State<NavigationScreen> createState() => _NavigationScreenState();
}

class _NavigationScreenState extends State<NavigationScreen> {
  int index = 0;
  final pages = [
    HomePage(),
    MovieCart(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[index],
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: kBgColor,
        items: const [
          FaIcon(FontAwesomeIcons.home, color: kTextColor,size: 30,),
          FaIcon(FontAwesomeIcons.shoppingCart, color: kTextColor,size: 30,),
          FaIcon(FontAwesomeIcons.search, color: kTextColor,size: 30,),
        ],
        index: index,
        onTap: (_index) {
          setState(() {
            index = _index;
          });
        },
        height: 60.0,
        animationDuration: const Duration(seconds: 300),
        animationCurve: Curves.easeIn,
      ),
    );
  }
}
