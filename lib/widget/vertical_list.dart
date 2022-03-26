import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../components/constants.dart';
import '../components/size_config.dart';
import '../home/movies_detail.dart';
import '../models/movie_model.dart';




class VerticalList extends StatelessWidget {
  const VerticalList({
    Key? key,
    required this.model,
  }) : super(key: key);

  final List<MovieModel> model;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      //itemCount: model.length > 10? 10: model.length,
        itemCount: model.length,
        scrollDirection: Axis.vertical,
        itemBuilder: (context, index){
          return GestureDetector(
            onTap: () =>  Navigator.of(context).push(MaterialPageRoute(builder:(context) => MovieDetails(movie: model[index],))),
            // Navigator.of(context).push(MovieDetails.routeName),
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(vertical: getProportionateScreenWidth(5)),
                  child: Row(
                    children: [
                      Hero(
                        tag: model[index].id!,
                        child: Container(
                          height: getProportionateScreenHeight(150),
                          width: getProportionateScreenWidth(120),
                          decoration: BoxDecoration(
                            borderRadius: const BorderRadius.only(topLeft: Radius.circular(5), bottomLeft: Radius.circular(5)),
                              image: DecorationImage(
                                fit: BoxFit.cover,
                                image: NetworkImage(model[index].posterurl!),
                              )
                          ),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.all(getProportionateScreenWidth(10)),
                        height: getProportionateScreenHeight(150),
                        width: getProportionateScreenWidth(120),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('${model[index].title}',
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
                                    TextSpan(text: "${model[index].imdbRating}"),
                                  ]
                              ),
                            ),
                            //Text("${timeFormat(model[index].duration!)}",
                            //style: textStyle,),
                            Text("${model[index].releaseDate}", style: textStyle,),

                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          );
        });
  }
}