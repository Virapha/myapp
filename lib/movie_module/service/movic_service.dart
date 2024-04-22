import 'package:flutter/foundation.dart';

import 'package:http/http.dart' as http;
import 'package:movie_api/movie_module/model/movie_model.dart';

const global_api = "f217e86f31604768c3563d7aa05874a6";

class MovieService{
  static Future<MovieModel> getAPI() async {
    try {
      http.Response response =
          await http.get(Uri.parse("https://api.themoviedb.org/3/trending/all/day?language=en-US&api_key=$global_api"));
      return compute(movieModelFromMap, response.body);
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
