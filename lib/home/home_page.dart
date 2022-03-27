import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:movieapp/blocs/movie_bloc/movie_bloc.dart';
<<<<<<< HEAD
import 'package:movieapp/home/movie_cart.dart';
=======
>>>>>>> 05b53130005a2696f02749b48478b846a35509d6
import '../components/constants.dart';
import '../components/size_config.dart';
import '../home/body.dart';



class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  static String routeName = "/homepage";
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final MovieBloc _bloc = MovieBloc();

<<<<<<< HEAD


=======
>>>>>>> 05b53130005a2696f02749b48478b846a35509d6
  String timeFormat(String formatTime) {
    DateTime time = DateTime.parse(formatTime);
    return DateFormat.Hms().format(time);
  }

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
<<<<<<< HEAD
=======
        leading: Padding(
          padding:  EdgeInsets.all(getProportionateScreenWidth(10)),
          child: const FaIcon(
            FontAwesomeIcons.alignJustify,
            color: kTextColor,
          ),
        ),
>>>>>>> 05b53130005a2696f02749b48478b846a35509d6
        centerTitle: true,
        title: Text("Movies", style: headingStyle,
        ),
        actions: [
          IconButton(
              onPressed: () {},
              icon: const FaIcon(
<<<<<<< HEAD
                FontAwesomeIcons.signOutAlt,
=======
                FontAwesomeIcons.bell,
>>>>>>> 05b53130005a2696f02749b48478b846a35509d6
                color: kTextColor,
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
<<<<<<< HEAD

=======
>>>>>>> 05b53130005a2696f02749b48478b846a35509d6
    );
  }

  Center _buildLoading() => const Center(child: CircularProgressIndicator(color: kTextColor,));
}








