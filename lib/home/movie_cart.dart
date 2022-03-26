import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:movieapp/components/constants.dart';

import '../components/size_config.dart';

class MovieCart extends StatefulWidget {
  const MovieCart({Key? key}) : super(key: key);

  static String routeName = '/moviecart';
  @override
  State<MovieCart> createState() => _MovieCartState();
}

class _MovieCartState extends State<MovieCart> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      backgroundColor: kBgColor,
      appBar: AppBar(
        title: Text("Watch List", style: headingStyle,),
        elevation: 0,
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () {
              },
              icon: const FaIcon(
                FontAwesomeIcons.signOutAlt,
                color: kTextColor,
              ))
        ],
        backgroundColor: kBgColor,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            height: getProportionateScreenHeight(600),
            padding: EdgeInsets.symmetric(horizontal: getProportionateScreenHeight(10)),
            child: ListView.builder(
            //itemCount: model.length > 10? 10: model.length,
            itemCount:5,
                scrollDirection: Axis.vertical,
                itemBuilder: (context, index){
                  return GestureDetector(
                    // onTap: () =>  Navigator.of(context).push(MaterialPageRoute(builder:(context) => MovieDetails(movie: model[index],))),
                    // Navigator.of(context).push(MovieDetails.routeName),
                    child: Card(
                      elevation: 5,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
                      child: Padding(
                        padding: EdgeInsets.symmetric(vertical: getProportionateScreenWidth(5)),
                        child: Row(
                          children: [
                            Container(
                              height: getProportionateScreenHeight(170),
                              width: getProportionateScreenWidth(120),
                              decoration: const BoxDecoration(
                                  borderRadius:  BorderRadius.only(topLeft: Radius.circular(5), bottomLeft: Radius.circular(5)),
                                  image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image: NetworkImage("https://images-na.ssl-images-amazon.com/images/M/MV5BNTVlODgwMjgtZGUzMy00ZTY1LWIyMDEtYTI2Y2JlYzVjZTNkXkEyXkFqcGdeQXVyNTg0MDM1MzY@._V1_SY500_CR0,0,337,500_AL_.jpg"),
                                  )
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.all(getProportionateScreenWidth(10)),
                              height: getProportionateScreenHeight(170),
                              width: getProportionateScreenWidth(120),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('model[index].title',
                                    style: labelTextStyle,),
                                  RichText(
                                    text: TextSpan(
                                        style: textStyle,
                                        children: [
                                          WidgetSpan(
                                            child: Padding(
                                              padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(2)),
                                              child: const FaIcon(FontAwesomeIcons.solidStar,
                                                color: kSpanIconColor,
                                                size: 17,
                                              ),
                                            ),
                                          ),
                                          TextSpan(text: "model[index].imdbRating"),
                                        ]
                                    ),
                                  ),
                                  //Text("${timeFormat(model[index].duration!)}",
                                  //style: textStyle,),
                                  Text("model[index].releaseDate", style: textStyle,),

                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  );
                }),
          ),
        ),
      ),
    );
  }
}
