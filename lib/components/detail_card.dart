import 'package:flutter/material.dart';
import '../components/size_config.dart';

import 'constants.dart';

class DetailCard extends StatelessWidget {
  const DetailCard({
    Key? key,
    this.text, this.press, this.color
  }) : super(key: key);

  final String? text;
  final Function? press;
  final Color? color;


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press as void Function()?,
      child: Card(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),),
        color: color!,
        elevation: 10,
        child: Padding(
          padding: EdgeInsets.all(getProportionateScreenWidth(5)),
          child: Text(
            text!,
            style: textStyle,
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}