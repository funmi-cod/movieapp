part of 'watch_list_bloc.dart';


class MovieState extends Equatable {
  const MovieState(this.movieList);

  final List<MovieModel> movieList;
  @override
  List<Object?> get props => [movieList];

  MovieState add (movieList) {
    var cartItems = movieList;
    cartItems.add(movieList);
    return MovieState(cartItems);
  }
  MovieState delete (movieList) {
    var cartItems = movieList;
    cartItems.remove(movieList);
    return MovieState(cartItems);
  }
}