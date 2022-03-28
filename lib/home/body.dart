// ignore_for_file: unnecessary_null_comparison

import 'package:flutter/material.dart';

import '../components/constants.dart';
import '../components/detail_card.dart';
import '../components/size_config.dart';
import '../models/movie_model.dart';
import '../widget/horizontal_list.dart';
import '../widget/vertical_list.dart';



class Body extends StatelessWidget {
  const Body({
    Key? key,
    required this.context,
    required this.model,
  }) : super(key: key);

  final BuildContext context;
  final List<MovieModel> model;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(5)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Now Showing',
                style: headingStyle,
              ),
              const DetailCard(
                text: 'view all',
                color: kBgColor,
              ),
            ],
          ),
        ),
        SizedBox(height: SizeConfig.screenHeight * 0.02,),
        SizedBox(
          height: getProportionateScreenHeight(260),
          child: HorizontalList(model: model),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(5)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Popular',
                style: headingStyle,
              ),
              GestureDetector(
                child: const DetailCard(
                  text: 'view all',
                  color: kBgColor,
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: SizeConfig.screenHeight * 0.02,),
        Container(
          height: getProportionateScreenHeight(500),
          padding: EdgeInsets.symmetric(
              horizontal: getProportionateScreenWidth(10)),
          child: VerticalList(model: model),
        ),
      ],
    );
  }
}





