import 'package:flutter/material.dart';
import 'package:movieapp/components/constants.dart';
import 'package:movieapp/components/size_config.dart';

import 'components/body.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({Key? key}) : super(key: key);

  static String routeName = "/signin";
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      backgroundColor: kBgColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding:  EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(10)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SizedBox(height: SizeConfig.screenHeight * 0.10,),
                Text("Welcome, \n  Sign in here", style: headingStyle,),
                Body()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
