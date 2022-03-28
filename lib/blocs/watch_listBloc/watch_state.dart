part of 'watch_list_bloc.dart';


class WatchListState extends Equatable {
  const WatchListState(this.movieList);

  final List<MovieModel> movieList;
  @override
  List<Object?> get props => [movieList];

  WatchListState add (movieList) {
    var cartItems = movieList;
    cartItems.add(movieList);
    return WatchListState(cartItems);
  }
  WatchListState delete (movieList) {
    var cartItems = movieList;
    cartItems.delete(movieList);
    return WatchListState(cartItems);
  }
}