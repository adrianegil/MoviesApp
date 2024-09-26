import 'dart:convert';
import 'dart:io';

import 'package:get/get.dart';
import 'package:http/http.dart';
import 'package:moviesapp/network/model/genre_model.dart';
import 'package:moviesapp/network/utils/data_provider.dart';
import 'package:moviesapp/network/utils/url_provider.dart';

class ApiGenre {
  /// Llamada al endpoint de Obtener todos los Generos de Peliculas.
  static Future<List<GenreModel>> getAllGenres() async {
    List<GenreModel> list = [];
    try {
      var response = await get(
          Uri.parse('${UrlProvider.BASE_URL}genre/movie/list'),
          headers: {
            'Authorization': 'Bearer ${DataProvider.ACCESS_TOKEN}',
          });

      switch (response.statusCode) {
        case 200:
          {
            var decodeResponse = jsonDecode(response.body);
            if (decodeResponse['genres'] != null) {
              decodeResponse['genres'].forEach((v) {
                list.add(new GenreModel.fromJson(v));
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
