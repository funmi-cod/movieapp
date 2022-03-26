import 'package:flutter/material.dart';
import '../components/constants.dart';

class DefaultDivider extends StatelessWidget {
  const DefaultDivider({Key? key, this.text}) : super(key: key);

  final String? text;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Divider(
          color: kTextColor,
          height: 15,
          thickness: 20,
          indent: 3,
          endIndent: 0,
        ),
        Text(text!, style: textStyle,),
        const Divider(
          color: kTextColor,
          thickness: 1,
          indent: 3,
          endIndent: 3,
        ),
      ],
    );
  }
}
