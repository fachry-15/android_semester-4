import 'dart:convert';

import 'package:acara_35/model/popular_movies.dart';
import 'package:http/http.dart' show Client, Response;

class ApiProvider {
  String apiKey = '5d9e5e4f42c7e1b330fdf6f2538bbc92';
  String baseUrl = 'https://api.themoviedb.org/3';

  Client client = Client();

  Future<PopularMovies> getPopularMovies() async {
    //  String url = '$baseUrl/movie/popular?api_key=$apiKey';
    //  print(url);
    Response response =
        await client.get('$baseUrl/movie/popular?api_key=$apiKey');

    if (response.statusCode == 200) {
      return PopularMovies.fromJson(jsonDecode(response.body));
    } else {
      throw Exception(response.statusCode);
    }
  }
}
