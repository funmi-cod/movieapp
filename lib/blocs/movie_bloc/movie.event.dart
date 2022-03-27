// Get the movie list
part of 'movie_bloc.dart';


abstract class MovieEvent extends Equatable{
  const MovieEvent();

  @override
  List<Object> get props =>[];
}


class GetMovieList extends MovieEvent{}

class AddMovieToCartEvent extends MovieEvent{
  List<MovieModel> cartItems;
  AddMovieToCartEvent(this.cartItems);
}

class DeleteMovieFromCartEvent extends MovieEvent {
  List<MovieModel> cartItems;
  int index;
  DeleteMovieFromCartEvent(this.cartItems, this.index);
}


