
// Get the movie list
part of 'watch_list_bloc.dart';

abstract class WatchListEvent extends Equatable{
  const WatchListEvent();

  @override
  List<Object> get props =>[];
}


class AddMovieToCartEvent extends WatchListEvent{
  final MovieModel cartItems;
  AddMovieToCartEvent(this.cartItems);
}

class DeleteMovieFromCartEvent extends WatchListEvent {
  final MovieModel cartItems;
  const DeleteMovieFromCartEvent(this.cartItems);
}