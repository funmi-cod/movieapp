import 'api_provider.dart';
import 'api_response.dart';
import '../models/movie_model.dart';

class ApiRepository {
  final _provider = ApiProvider();

  Future<ApiResponse<List<MovieModel>>> fetchMovieList() {
    return _provider.fetchMovieList();
  }
}

class NetworkError extends Error {}