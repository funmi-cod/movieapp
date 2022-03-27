
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:movieapp/models/movie_model.dart';

import '../components/constants.dart';
import '../components/detail_card.dart';
import '../components/size_config.dart';

<<<<<<< HEAD
class MovieDetails extends StatefulWidget {
   const MovieDetails({Key? key, required this.movie}) : super(key: key);
=======
class MovieDetails extends StatelessWidget {
  const MovieDetails({Key? key, required this.movie}) : super(key: key);
>>>>>>> 05b53130005a2696f02749b48478b846a35509d6

  //static String routeName = '/moviedetails';
  final MovieModel movie;

<<<<<<< HEAD

  @override
  State<MovieDetails> createState() => _MovieDetailsState();
}

class _MovieDetailsState extends State<MovieDetails> {
  var isSelected = false;

=======
>>>>>>> 05b53130005a2696f02749b48478b846a35509d6
  @override
  Widget build(BuildContext context) {
    //final routeArgs = ModalRoute.of(context)?.settings.arguments as Map<String,String>;

    //final id = routeArgs['id'];
    SizeConfig().init(context);
    return Scaffold(
      backgroundColor: kBgColor,
      appBar: AppBar(
        elevation: 0,
<<<<<<< HEAD
        iconTheme: const IconThemeData(color: kTextColor),
=======
        iconTheme: IconThemeData(color: kTextColor),
>>>>>>> 05b53130005a2696f02749b48478b846a35509d6
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
<<<<<<< HEAD
                            image: NetworkImage(widget.movie.posterurl!),
=======
                            image: NetworkImage(movie.posterurl!),
>>>>>>> 05b53130005a2696f02749b48478b846a35509d6
                          )
                      ),
                    ),
                  ),
                ),
                SizedBox(height: SizeConfig.screenHeight * 0.05,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
<<<<<<< HEAD
                    Text( '${widget.movie.title}', style: headingStyle,),
                    GestureDetector(
                      onTap: (){
                        setState(() {
                          isSelected = true;

                        });
                      },
                        child: isSelected ?
                        const FaIcon(FontAwesomeIcons.solidBookmark,
                          color: kSpanIconColor,) :
                        const FaIcon(FontAwesomeIcons.bookmark,
                          color: kTextColor,),
                    ),
=======
                    Text( '${movie.title}', style: headingStyle,),
                    const FaIcon(FontAwesomeIcons.bookmark, color: kTextColor,)
>>>>>>> 05b53130005a2696f02749b48478b846a35509d6
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
<<<<<<< HEAD
                        TextSpan(text: '${widget.movie.imdbRating}', style: textStyle),
=======
                        TextSpan(text: '${movie.imdbRating}', style: textStyle),
>>>>>>> 05b53130005a2696f02749b48478b846a35509d6
                      ]
                  ),
                ),
                SizedBox(
                  height: getProportionateScreenHeight(50),
                  width: getProportionateScreenWidth(400),
                  child: ListView.builder(
<<<<<<< HEAD
                      itemCount: widget.movie.genres!.length,
=======
                      itemCount: movie.genres!.length,
>>>>>>> 05b53130005a2696f02749b48478b846a35509d6
                      physics: const NeverScrollableScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index){
                        return Padding(
                          padding: EdgeInsets.all(getProportionateScreenWidth(8)),
                          child: DetailCard(
<<<<<<< HEAD
                            text: widget.movie.genres![index],
=======
                            text: movie.genres![index],
>>>>>>> 05b53130005a2696f02749b48478b846a35509d6
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
<<<<<<< HEAD
                        Text('${widget.movie.duration}', style: labelTextStyle,),
=======
                        Text('${movie.duration}', style: labelTextStyle,),
>>>>>>> 05b53130005a2696f02749b48478b846a35509d6
                      ],
                    ),
                    SizedBox(width: SizeConfig.screenWidth * 0.08),
                    Column(
                      children: [
                        Text("Year", style: textStyle,),
<<<<<<< HEAD
                        Text('${widget.movie.year}', style: labelTextStyle,),
=======
                        Text('${movie.year}', style: labelTextStyle,),
>>>>>>> 05b53130005a2696f02749b48478b846a35509d6
                      ],
                    ),
                  ],
                ),
                SizedBox(height: SizeConfig.screenHeight * 0.02,),
                Text("Description", style: headingStyle,),
                SizedBox(height: SizeConfig.screenHeight * 0.02,),
<<<<<<< HEAD
                Text('${widget.movie.storyline}',
=======
                Text('${movie.storyline}',
>>>>>>> 05b53130005a2696f02749b48478b846a35509d6
                  style: textStyle,
                ),
                SizedBox(height: SizeConfig.screenHeight * 0.02,),
                Text("Cast", style: headingStyle,),
                SizedBox(
                  height: getProportionateScreenHeight(50),
                  width: getProportionateScreenWidth(400),
                  child: ListView.builder(
<<<<<<< HEAD
                      itemCount: widget.movie.actors!.length,
=======
                      itemCount: movie.actors!.length,
>>>>>>> 05b53130005a2696f02749b48478b846a35509d6
                      physics: const NeverScrollableScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index){
                        return Padding(
                          padding: EdgeInsets.all(getProportionateScreenWidth(8)),
                          child: DetailCard(
<<<<<<< HEAD
                            text: widget.movie.actors![index],
=======
                            text: movie.actors![index],
>>>>>>> 05b53130005a2696f02749b48478b846a35509d6
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
