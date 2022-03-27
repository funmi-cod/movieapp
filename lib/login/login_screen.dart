import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:movieapp/auth/fire_auth.dart';
import 'package:movieapp/auth/validation.dart';
import 'package:movieapp/components/constants.dart';
import 'package:movieapp/components/default_btn.dart';
import 'package:movieapp/components/size_config.dart';
import 'package:movieapp/home/home_page.dart';
import 'package:movieapp/home/navigation.dart';

import '../components/custom_indicator.dart';
import '../sign_in/sign_in_screen.dart';

class LogInScreen extends StatefulWidget {
  const LogInScreen({Key? key}) : super(key: key);

  static String routeName = "/login";
  @override
  State<LogInScreen> createState() => _LogInScreenState();
}

class _LogInScreenState extends State<LogInScreen> {

  final _formKey = GlobalKey<FormState>();

  final _emailTextController = TextEditingController();
  final _passwordTextController = TextEditingController();

  //final _focusEmail = FocusNode();
  //final _focusPassword = FocusNode();


  bool _isProcessing = false;

  Future<void> _initializeFirebase() async {
     await Firebase.initializeApp();

    User? user = FirebaseAuth.instance.currentUser;

    if (user!= null) {

      Navigator.of(context).pushNamed(NavigationScreen.routeName,arguments: user);
    }


  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return Scaffold(
      body: FutureBuilder(
        future: _initializeFirebase(),
        builder: (context, snapshot){
          if (snapshot.connectionState == ConnectionState.done) {
              return SafeArea(
                child: SingleChildScrollView(
                  child: Padding(
                    padding:  EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(10)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        SizedBox(height: SizeConfig.screenHeight * 0.10,),
                        Text("Welcome, \n  Log in here", style: headingStyle,),
                        Column(
                          children: [
                            SizedBox(
                              height: SizeConfig.screenHeight * 0.10,
                            ),
                            Form(
                              key: _formKey,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                                  Text(
                                    'E-mail',
                                    style: labelTextStyle,
                                  ),
                                  SizedBox(
                                    height: SizeConfig.screenHeight * 0.02,
                                  ),
                                  buildEmailTextFormField(),
                                  SizedBox(
                                    height: SizeConfig.screenHeight * 0.02,
                                  ),
                                  Text(
                                    'Password',
                                    style: labelTextStyle,
                                  ),
                                  SizedBox(
                                    height: SizeConfig.screenHeight * 0.02,
                                  ),
                                  buildPasswordTextFormField(),
                                  SizedBox(
                                    height: SizeConfig.screenHeight * 0.05,
                                  ),
                                  _isProcessing? CustomIndicator()
                                      :DefaultButton(
                                    text: 'Log In',
                                    press: () async{
                                      //_focusEmail.unfocus();
                                      //_focusPassword.unfocus();
                                      if(_formKey.currentState!.validate()){
                                        setState(() {
                                          _isProcessing = true;
                                        });
                                        User? user = await FireAuth.signInUsingEmailPassword(
                                            email: _emailTextController.text,
                                            password: _passwordTextController.text);
                                        setState(() {
                                          _isProcessing = false;
                                        });
                                        if (user != null) {
                                          Navigator.of(context).pushNamed(HomePage.routeName,arguments: user);
                                        }
                                      }
                                    },
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: SizeConfig.screenHeight * 0.05,
                            ),
                            RichText(text: TextSpan(
                              text: "Don\'t have an account? ", style: textStyle,
                              children: [
                                TextSpan(text: 'Sign In', style: textSpanStyle,
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () => Navigator.pushNamed(context, SignInScreen.routeName),
                                ),
                              ],
                            ),
                            ),
                            SizedBox(height: SizeConfig.screenHeight * 0.04,),
                          ],
                        ),

                      ],
                    ),
                  ),
                ),
              );
            }
            return Center(child: SizedBox(child: Text('Not working'),));
              //CustomIndicator();

        },
      ),
    );
  }

  TextFormField buildPasswordTextFormField() => TextFormField(
    obscureText: true,
    textAlign: TextAlign.center,
    controller: _passwordTextController,

    //focusNode: _focusPassword,
    validator: (value) => Validator.validatePassword(password: value!),

    decoration: passInputDecoration,
  );

  TextFormField buildEmailTextFormField() => TextFormField(
    keyboardType: TextInputType.emailAddress,
    textAlign: TextAlign.center,
    controller:  _emailTextController,
   // focusNode: _focusEmail,
    validator: (value) => Validator.validateEmail(email: value!),
    decoration: emailInputDecoration,
  );
}

