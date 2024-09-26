import 'dart:convert';
import 'dart:io';

import 'package:get/get.dart';
import 'package:http/http.dart';
import 'package:moviesapp/network/model/movie_model.dart';
import 'package:moviesapp/network/utils/data_provider.dart';
import 'package:moviesapp/network/utils/url_provider.dart';

/// Clase encargada de realizar las llamadas al servidor para los endpoints asociados a las Películas.
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

  /// Llamada al endpoint de Obtener las Películas mejor valoradas.
  static Future<List<MovieModel>> getAllTopRatedMovies() async {
    List<MovieModel> list = [];
    try {
      var response = await get(
          Uri.parse('${UrlProvider.BASE_URL}movie/top_rated'),
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

  /// Llamada al endpoint de Obtener las Peliculas por Género.
  static Future<List<MovieModel>> getAllMoviesByGenre(int genreId) async {
    List<MovieModel> list = [];
    try {
      var response = await get(
          Uri.parse(
              '${UrlProvider.BASE_URL}discover/movie?with_genres=$genreId'),
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

  /// Llamada al endpoint de Obtener las Peliculas por el Título.
  static Future<List<MovieModel>> getAllMoviesByTitle(String title) async {
    List<MovieModel> list = [];
    try {
      var response = await get(
          Uri.parse('${UrlProvider.BASE_URL}search/movie?query=$title'),
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
