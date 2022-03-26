import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'size_config.dart';

const kBgColor = Color(0xFFFFFFFF);
const kTextColor = Color(0xFF0A0909);
const kPrimaryColor = Color(0xFFEDE4E3);
const kSubTextColor = Color(0xFF868686);
const kSpanIconColor = Color(0xFFFFD700);
const kCardColor = Color(0xFF87CEFA);

final headingStyle = GoogleFonts.poppins(fontSize: getProportionateScreenWidth(20), color: kTextColor,height: 1.0, fontWeight: FontWeight.bold);

final textStyle = GoogleFonts.poppins(fontSize: getProportionateScreenWidth(12), color: kSubTextColor,fontWeight: FontWeight.normal);

final labelTextStyle = GoogleFonts.openSans(fontSize: getProportionateScreenWidth(12), color: kTextColor,fontWeight: FontWeight.bold);

final socialTextStyle = GoogleFonts.openSans(fontSize: getProportionateScreenWidth(12), color: kTextColor,fontWeight: FontWeight.w300);

final textSpanStyle = GoogleFonts.openSans(fontSize: getProportionateScreenWidth(15), color: kTextColor,fontWeight: FontWeight.w300);

final btnTextStyle = GoogleFonts.openSans(fontSize: getProportionateScreenWidth(17), color: kBgColor,fontWeight: FontWeight.bold);



// email form decoration
final emailInputDecoration = InputDecoration(
  contentPadding: const EdgeInsets.symmetric(
    vertical: 2.2, horizontal: 4,
  ),
  filled: true,
  prefixIcon: Icon(Icons.email,color: kTextColor,),
  //fillColor: kPrimaryColor,
  border: passOutlineInputBorder(),
  focusedBorder: passOutlineInputBorder(),
  enabledBorder: passOutlineInputBorder(),
);

OutlineInputBorder outlineInputBorder() => OutlineInputBorder(
  borderRadius: BorderRadius.circular(5),
  borderSide: const BorderSide(color:kPrimaryColor)
);


// email form decoration
final passInputDecoration = InputDecoration(
  contentPadding: const EdgeInsets.symmetric(
    vertical: 2.2,
  ),
  filled: true,
  prefixIcon: Icon(Icons.lock,color: kTextColor,),
  //fillColor: kPrimaryColor,
  border: passOutlineInputBorder(),
  focusedBorder: passOutlineInputBorder(),
  enabledBorder: passOutlineInputBorder(),
);

OutlineInputBorder passOutlineInputBorder() => OutlineInputBorder(
    borderRadius: BorderRadius.circular(5),
    borderSide: const BorderSide(color:kPrimaryColor),
);