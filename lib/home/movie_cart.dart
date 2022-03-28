import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:movieapp/blocs/watch_listBloc/watch_list_bloc.dart';
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
          child: BlocBuilder<WatchListBloc, WatchListState>(
            builder: (context, state) {
              return Container(
                height: getProportionateScreenHeight(600),
                padding: EdgeInsets.symmetric(horizontal: getProportionateScreenHeight(10)),
                child: ListView.builder(
                  //itemCount: model.length > 10? 10: model.length,
                    itemCount:state.movieList.length,
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
                                  decoration: BoxDecoration(
                                      borderRadius:  BorderRadius.only(topLeft: Radius.circular(5), bottomLeft: Radius.circular(5)),
                                      image: DecorationImage(
                                        fit: BoxFit.cover,
                                        image: NetworkImage(state.movieList[index].posterurl!),
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
                                      Text(state.movieList[index].title!,
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
                                              TextSpan(text: "${state.movieList[index].imdbRating}"),
                                            ]
                                        ),
                                      ),
                                      //Text("${timeFormat(model[index].duration!)}",
                                      //style: textStyle,),
                                      Text(state.movieList[index].releaseDate!, style: textStyle,),

                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height:  getProportionateScreenHeight(170),
                                  width: getProportionateScreenWidth(50),
                                  child: GestureDetector(
                                    onTap: () => BlocProvider.of<WatchListBloc>(context).add(DeleteMovieFromCartEvent(state.movieList[index])),
                                    child: Center(
                                        child: FaIcon(FontAwesomeIcons.times,
                                          color: Colors.red,size: 30,)),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    }),
              );
            }),

          ),
        ),
    );
  }
}
