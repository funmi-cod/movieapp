// Get the movie list
part of 'movie_bloc.dart';


abstract class MovieEvent extends Equatable{
  const MovieEvent();

  @override
  List<Object> get props =>[];
}

<<<<<<< HEAD
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
=======
class GetMovieList extends MovieEvent{}
>>>>>>> 05b53130005a2696f02749b48478b846a35509d6
