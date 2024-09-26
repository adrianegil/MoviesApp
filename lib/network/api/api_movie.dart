import 'dart:convert';
import 'dart:io';

import 'package:get/get.dart';
import 'package:http/http.dart';
import 'package:moviesapp/network/model/movie_model.dart';
import 'package:moviesapp/network/utils/data_provider.dart';
import 'package:moviesapp/network/utils/url_provider.dart';

class ApiMovie {
  /// Llamada al endpoint de Obtener las Peliculas más populares.
  static Future<List<MovieModel>> getAllPopularMovies() async {
    List<MovieModel> list = [];
    try {
      var response = await get(
          Uri.parse('${UrlProvider.BASE_URL}movie/popular'),
          headers: {
            'Authorization': 'Bearer ${DataProvider.ACCESS_TOKEN}',
          });

      switch (response.statusCode) {
        case 200:
          {
            var decodeResponse = jsonDecode(response.body);
            if (decodeResponse['results'] != null) {
              decodeResponse['results'].forEach((v) {
                list.add(new MovieModel.fromJson(v));
              });
            }
            return list;
          }
        default:
          throw ("unexpected_error_has_occurred".tr);
      }
    } on SocketException {
      throw ("failed_to_connect_to_server".tr);
    } on HttpException {
      throw ("http_call_failed".tr);
    } catch (e) {
      rethrow;
    }
  }
}
