import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:movieapp/components/constants.dart';
import 'package:movieapp/components/default_divider.dart';
import 'package:movieapp/components/size_config.dart';
import 'package:movieapp/components/social_card.dart';
import 'package:movieapp/sign_in/components/signin_form.dart';

import '../../login/login_screen.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Column(
      children: [
        SizedBox(
          height: SizeConfig.screenHeight * 0.10,
        ),
        SignInForm(),
        SizedBox(
          height: SizeConfig.screenHeight * 0.05,
        ),
        RichText(text: TextSpan(
          text: "Already have an account?", style: textStyle,
          children: [
            TextSpan(text: 'Log In', style: textSpanStyle,
              recognizer: TapGestureRecognizer()
                ..onTap = () => Navigator.pushNamed(context, LogInScreen.routeName),
            ),
          ],
        ),
        ),
        SizedBox(height: SizeConfig.screenHeight * 0.04,),
        const DefaultDivider(
          text: 'Sign In with',
        ),
        SizedBox(
          height: getProportionateScreenHeight(5),
        ),
        SocialCard(
          text: 'Google',
          icon: 'assets/google.png',
          press: () {},
        )
      ],
    );
  }
}
