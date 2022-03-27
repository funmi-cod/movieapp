
// Get the movie list
part of 'watch_list_bloc.dart';

abstract class MovieEvent extends Equatable{
  const MovieEvent();

  @override
  List<Object> get props =>[];
}


class GetMovieList extends MovieEvent{}

class AddMovieToCartEvent extends MovieEvent{
  final MovieModel cartItems;
  AddMovieToCartEvent(this.cartItems);
}

class DeleteMovieFromCartEvent extends MovieEvent {
  final MovieModel cartItems;

  const DeleteMovieFromCartEvent(this.cartItems);
}