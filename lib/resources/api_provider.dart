import 'dart:convert';

import 'package:dio/dio.dart';
import '../models/movie_model.dart';
import '../resources/api_response.dart';

// use the dio plugin to fetch the data from Api
class ApiProvider {
  final Dio _dio = Dio();
  final String _url = "https://raw.githubusercontent.com/FEND16/movie-json-data/master/json/movies-coming-soon.json";

  Future<ApiResponse<List<MovieModel>>> fetchMovieList() async {
    try {
      Response response = await _dio.get(_url);
      print(response.statusCode);
      print(response.data.runtimeType);
      print(response);

      final jdecode= jsonDecode(response.data?.toString()??'');
      print(jdecode.runtimeType);
      if((response.statusCode! >= 200 || response.statusCode! < 300) && jdecode is List) {

        final data = jdecode.map<MovieModel>((e) =>MovieModel.fromJson(e as Map<String, dynamic>)).toList();
        print(data.runtimeType);
        return ApiResponse<List<MovieModel>> (isSuccessful: true, body: data);
      } else {
        return ApiResponse<List<MovieModel>>(isSuccessful: false, errorMessage: "Data not found. Please check connection");
      }
    } catch (error, stackTrace) {
      print("Exception occurred: $error stackTrace: $stackTrace");
      return ApiResponse<List<MovieModel>>(isSuccessful: false, errorMessage: "Data not found. Please check connection!");
    }
  }
}