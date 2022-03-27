import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movieapp/resources/api_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:movieapp/models/movie_model.dart';

part 'watch_event.dart';
part 'watch_state.dart';


class MovieBloc extends Bloc<MovieEvent, MovieState> {
  MovieBloc() : super(MovieState([])) {
    final ApiRepository _apiRepository = ApiRepository();
  }
}