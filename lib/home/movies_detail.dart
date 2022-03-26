
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:movieapp/models/movie_model.dart';

import '../components/constants.dart';
import '../components/detail_card.dart';
import '../components/size_config.dart';

class MovieDetails extends StatelessWidget {
  const MovieDetails({Key? key, required this.movie}) : super(key: key);

  //static String routeName = '/moviedetails';
  final MovieModel movie;

  @override
  Widget build(BuildContext context) {
    //final routeArgs = ModalRoute.of(context)?.settings.arguments as Map<String,String>;

    //final id = routeArgs['id'];
    SizeConfig().init(context);
    return Scaffold(
      backgroundColor: kBgColor,
      appBar: AppBar(
        elevation: 0,
        iconTheme: IconThemeData(color: kTextColor),
        //leading: const FaIcon(FontAwesomeIcons.arrowLeft, color: kTextColor,),
        backgroundColor: kBgColor,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(10)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Card(
                    elevation: 5,
                    child: Container(
                      height: getProportionateScreenHeight(450),
                      width: getProportionateScreenWidth(300),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image: NetworkImage(movie.posterurl!),
                          )
                      ),
                    ),
                  ),
                ),
                SizedBox(height: SizeConfig.screenHeight * 0.05,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text( '${movie.title}', style: headingStyle,),
                    const FaIcon(FontAwesomeIcons.bookmark, color: kTextColor,)
                  ],
                ),
                //SizedBox(height: SizeConfig.screenHeight * 0.03,),
                RichText(
                  text: TextSpan(
                      style: textStyle,
                      children: [
                        WidgetSpan(
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(2)),
                            child:  const FaIcon(FontAwesomeIcons.solidStar,
                              color: kSpanIconColor,
                              size: 17,
                            ),
                          ),
                        ),
                        TextSpan(text: '${movie.imdbRating}', style: textStyle),
                      ]
                  ),
                ),
                SizedBox(
                  height: getProportionateScreenHeight(50),
                  width: getProportionateScreenWidth(400),
                  child: ListView.builder(
                      itemCount: movie.genres!.length,
                      physics: const NeverScrollableScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index){
                        return Padding(
                          padding: EdgeInsets.all(getProportionateScreenWidth(8)),
                          child: DetailCard(
                            text: movie.genres![index],
                            color: kCardColor,
                          ),
                        );
                      }),
                ),
                SizedBox(height: SizeConfig.screenHeight * 0.02,),
                Row(
                  children: [
                    Column(
                      children: [
                        Text("Length", style: textStyle,),
                        Text('${movie.duration}', style: labelTextStyle,),
                      ],
                    ),
                    SizedBox(width: SizeConfig.screenWidth * 0.08),
                    Column(
                      children: [
                        Text("Year", style: textStyle,),
                        Text('${movie.year}', style: labelTextStyle,),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: SizeConfig.screenHeight * 0.02,),
                Text("Description", style: headingStyle,),
                SizedBox(height: SizeConfig.screenHeight * 0.02,),
                Text('${movie.storyline}',
                  style: textStyle,
                ),
                SizedBox(height: SizeConfig.screenHeight * 0.02,),
                Text("Cast", style: headingStyle,),
                SizedBox(
                  height: getProportionateScreenHeight(50),
                  width: getProportionateScreenWidth(400),
                  child: ListView.builder(
                      itemCount: movie.actors!.length,
                      physics: const NeverScrollableScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index){
                        return Padding(
                          padding: EdgeInsets.all(getProportionateScreenWidth(8)),
                          child: DetailCard(
                            text: movie.actors![index],
                            color: kCardColor,
                          ),
                        );
                      }),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
