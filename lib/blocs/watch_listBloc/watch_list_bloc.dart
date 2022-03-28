import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:movieapp/models/movie_model.dart';

part 'watch_event.dart';
part 'watch_state.dart';


class WatchListBloc extends Bloc<WatchListEvent, WatchListState> {
  WatchListBloc() : super(WatchListState([])) {
    on<AddMovieToCartEvent>((event, emit) async {
      emit((state.add(event.cartItems)));
    });
    on<DeleteMovieFromCartEvent>((event, emit) async {
      emit((state.delete(event.cartItems)));
    });

}
}
