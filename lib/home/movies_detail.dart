
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:movieapp/models/movie_model.dart';

import '../components/constants.dart';
import '../components/detail_card.dart';
import '../components/size_config.dart';

class MovieDetails extends StatefulWidget {
   const MovieDetails({Key? key, required this.movie}) : super(key: key);

  //static String routeName = '/moviedetails';
  final MovieModel movie;


  @override
  State<MovieDetails> createState() => _MovieDetailsState();
}

class _MovieDetailsState extends State<MovieDetails> {
  var isSelected = false;

  @override
  Widget build(BuildContext context) {
    //final routeArgs = ModalRoute.of(context)?.settings.arguments as Map<String,String>;

    //final id = routeArgs['id'];
    SizeConfig().init(context);
    return Scaffold(
      backgroundColor: kBgColor,
      appBar: AppBar(
        elevation: 0,
        iconTheme: const IconThemeData(color: kTextColor),
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
                            image: NetworkImage(widget.movie.posterurl!),
                          )
                      ),
                    ),
                  ),
                ),
                SizedBox(height: SizeConfig.screenHeight * 0.05,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
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
                        TextSpan(text: '${widget.movie.imdbRating}', style: textStyle),
                      ]
                  ),
                ),
                SizedBox(
                  height: getProportionateScreenHeight(50),
                  width: getProportionateScreenWidth(400),
                  child: ListView.builder(
                      itemCount: widget.movie.genres!.length,
                      physics: const NeverScrollableScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index){
                        return Padding(
                          padding: EdgeInsets.all(getProportionateScreenWidth(8)),
                          child: DetailCard(
                            text: widget.movie.genres![index],
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
                        Text('${widget.movie.duration}', style: labelTextStyle,),
                      ],
                    ),
                    SizedBox(width: SizeConfig.screenWidth * 0.08),
                    Column(
                      children: [
                        Text("Year", style: textStyle,),
                        Text('${widget.movie.year}', style: labelTextStyle,),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: SizeConfig.screenHeight * 0.02,),
                Text("Description", style: headingStyle,),
                SizedBox(height: SizeConfig.screenHeight * 0.02,),
                Text('${widget.movie.storyline}',
                  style: textStyle,
                ),
                SizedBox(height: SizeConfig.screenHeight * 0.02,),
                Text("Cast", style: headingStyle,),
                SizedBox(
                  height: getProportionateScreenHeight(50),
                  width: getProportionateScreenWidth(400),
                  child: ListView.builder(
                      itemCount: widget.movie.actors!.length,
                      physics: const NeverScrollableScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index){
                        return Padding(
                          padding: EdgeInsets.all(getProportionateScreenWidth(8)),
                          child: DetailCard(
                            text: widget.movie.actors![index],
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
