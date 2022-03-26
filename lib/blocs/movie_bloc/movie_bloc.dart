import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movieapp/resources/api_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:movieapp/models/movie_model.dart';

part 'movie.event.dart';
part 'movie_state.dart';

class MovieBloc extends Bloc<MovieEvent, MovieState> {
  MovieBloc(): super(MovieInitial()){
    final ApiRepository _apiRepository = ApiRepository();

    on<GetMovieList>((event, emit) async {
      try {
        emit(MovieLoading());
        final response = await _apiRepository.fetchMovieList();
        if (response.isSuccessful && response.body != null) {
          emit(MovieLoaded(response.body!));
        } else {
          emit(MovieError(response.errorMessage));
        }
      } on NetworkError {
        emit(const MovieError("Failed to fetch data. Please check your connection"));
      }
    });
  }
}