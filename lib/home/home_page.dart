import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:movieapp/blocs/movie_bloc/movie_bloc.dart';
import 'package:movieapp/sign_in/sign_in_screen.dart';
import '../components/constants.dart';
import '../components/custom_indicator.dart';
import '../components/size_config.dart';
import '../home/body.dart';
import 'movie_cart.dart';



class HomePage extends StatefulWidget {
  const HomePage({Key? key,}) : super(key: key);


  static String routeName = "/homepage";
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final MovieBloc _bloc = MovieBloc();

  bool _isSignOut = false;

  @override
  void initState() {
    // TODO: implement initState
    _bloc.add(GetMovieList());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    SizeConfig().init(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kBgColor,
        elevation: 0,
        centerTitle: true,
        title: Text("Movies", style: headingStyle,
        ),
        actions: [
          IconButton(
              onPressed: () async{
                _isSignOut? CustomIndicator:setState(() {
                  _isSignOut = true;
                });
                await FirebaseAuth.instance.signOut();
                setState(() {
                  _isSignOut = false;
                });
                Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (context)=> SignInScreen()));
              },
              icon: const FaIcon(
                FontAwesomeIcons.signOutAlt,

              ))
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(getProportionateScreenWidth(10)),
            child: BlocProvider(
              create: (_) => _bloc,
                child: BlocListener<MovieBloc,MovieState>(
                  listener: (context, state) {
                    if (state is MovieError) {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Text(state.message!, style: textStyle,)));
                    }
                  },
                  child: BlocBuilder<MovieBloc, MovieState>(
                    builder: (context, state) {
                      if (state is MovieInitial){
                        return _buildLoading();
                      } else if (state is MovieLoading) {
                        return _buildLoading();
                      } else if (state is MovieLoaded) {
                        return Body(context: context, model: state.data);
                      } else if (state is MovieError) {
                        return Container();
                      } else {
                        return Container();}
                    }),
                ),
            ),
          ),
        ),
      ),

    );
  }


  Center _buildLoading() => const Center(child: CircularProgressIndicator(color: kTextColor,));
}








