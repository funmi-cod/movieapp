import 'package:flutter/material.dart';
import '../components/constants.dart';
import '../components/size_config.dart';

class DefaultButton extends StatelessWidget {
  const DefaultButton({Key? key, this.text, this.press}) : super(key: key);

  final String? text;
  final Function? press;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: getProportionateScreenWidth(140),
      height: getProportionateScreenHeight(56),
      child: TextButton(
        style: TextButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          primary: kBgColor,
          backgroundColor: kTextColor,
        ),
        onPressed: press as void Function()?,
        child: Text(
          text!,
          style: btnTextStyle,
        ),
      ),
    );
  }
}
