import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../home/body.dart';
import '../components/constants.dart';
import '../components/size_config.dart';
import '../home/movies_detail.dart';
import '../models/movie_model.dart';

class HorizontalList extends StatelessWidget {
  const HorizontalList({
    Key? key,
    required this.model,
  }) : super(key: key);

  final List<MovieModel> model;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        scrollDirection: Axis.horizontal,
        //itemCount: model.length > 10 ? 10:model.length ,
        itemCount: model.length,
        itemBuilder: (context, index){
          return SizedBox(
            width: getProportionateScreenWidth(160),
            child: GestureDetector(
              onTap: () =>  Navigator.of(context).push(MaterialPageRoute(builder:(context) => MovieDetails(movie: model[index],))),
              child: Column(
                children: [
                  Padding(
                    padding:  EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(5)),
                    child: Card(
                      elevation: 10,
                      shadowColor: kPrimaryColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Hero(
                        tag: model[index].id!,
                        child: Container(
                          height: getProportionateScreenHeight(200),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              image: DecorationImage(
                                fit: BoxFit.cover,
                                image: NetworkImage(model[index].posterurl!),
                              )
                          ),
                        ),
                      ),
                    ),
                  ),
                  //SizedBox(height: SizeConfig.screenHeight * 0.02),
                  Text("${model[index].title}", style: labelTextStyle,),
                  RichText(
                    text: TextSpan(
                        style: textStyle,
                        children: [
                          WidgetSpan(
                            child: Padding(
                              padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(2)),
                              child: const FaIcon(FontAwesomeIcons.solidStar,
                                size: 17,
                                color: kSpanIconColor,
                              ),
                            ),
                          ),
                          TextSpan(text: "${model[index].imdbRating}"),
                        ]
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }
}