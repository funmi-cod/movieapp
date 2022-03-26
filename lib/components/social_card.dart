import 'package:flutter/material.dart';
import '../components/constants.dart';
import '../components/size_config.dart';

class SocialCard extends StatelessWidget {
  const SocialCard({Key? key, this.text, this.press, this.icon}) : super(key: key);
  
  final String? text;
  final Function? press;
  final String? icon;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press as void Function()?,
      child: Container(
        width: 120,
        child: Card(
          elevation: 4,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          child: Padding(
            padding: EdgeInsets.all(getProportionateScreenWidth(6)),
            child: Row(
              children: [
                Container(
                    margin: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(5)),
                    height: getProportionateScreenHeight(30),
                    width: getProportionateScreenWidth(18),
                    decoration: const BoxDecoration(
                      color: kBgColor,
                      shape: BoxShape.circle,
                    ),
                    child: Image.asset(icon!)),
                SizedBox(
                  width: getProportionateScreenWidth(4),
                ),
                Text(text!, style: socialTextStyle,),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
