import 'package:flutter/material.dart';
import 'package:movieapp/auth/validation.dart';
import 'package:movieapp/components/constants.dart';
import 'package:movieapp/components/custom_indicator.dart';
import 'package:movieapp/components/default_btn.dart';
import 'package:movieapp/components/size_config.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:movieapp/home/home_page.dart';

import '../../auth/fire_auth.dart';

class SignInForm extends StatefulWidget {
  const SignInForm({Key? key}) : super(key: key);

  @override
  State<SignInForm> createState() => _SignInFormState();
}

class _SignInFormState extends State<SignInForm> {

  final _formKey = GlobalKey<FormState>();

  final _emailTextController = TextEditingController();
  final _passwordTextController = TextEditingController();

  final _focusEmail = FocusNode();
  final _focusPassword = FocusNode();

  bool _isProcessing = false;

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            'E-mail',
            style: labelTextStyle,
          ),
          SizedBox(height: SizeConfig.screenHeight * 0.02,),
          buildEmailTextFormField(),
          SizedBox(
            height: SizeConfig.screenHeight * 0.02,
          ),
          Text(
            'Password',
            style: labelTextStyle,
          ),
          SizedBox(height: SizeConfig.screenHeight * 0.02,),
          buildPasswordTextFormField(),
          SizedBox(
            height: SizeConfig.screenHeight * 0.05,
          ),
          _isProcessing? CustomIndicator():
          DefaultButton(
            text: 'Sign In',
            press: () async{
              setState(() {
                _isProcessing = true;
              });
              if (_formKey.currentState!.validate()) {
                User? user = await FireAuth.registerUsingEmailPassword(
                    email: _emailTextController.text,
                    password: _passwordTextController.text);
                setState(() {
                  _isProcessing = false;
                });
                if (user != null) {
                  print('ready');
                  Navigator.of(context).pushNamed(HomePage.routeName, arguments: user);
                }
              }
            },
          ),
        ],
      ),
    );
  }

  TextFormField buildPasswordTextFormField() => TextFormField(
    controller: _passwordTextController,
    focusNode: _focusPassword,
    obscureText: true,
    textAlign: TextAlign.center,
    validator: (value) => Validator.validatePassword(
        password: value!),
    decoration: passInputDecoration,
  );

  TextFormField buildEmailTextFormField() => TextFormField(
    keyboardType: TextInputType.emailAddress,
    controller: _emailTextController,
    focusNode: _focusEmail,
    validator: (value) => Validator.validateEmail(
        email: value!),
    textAlign: TextAlign.center,

    decoration: emailInputDecoration,
  );
}
