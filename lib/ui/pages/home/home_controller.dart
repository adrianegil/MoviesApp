import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:moviesapp/network/api/api_genre.dart';
import 'package:moviesapp/network/api/api_movie.dart';
import 'package:moviesapp/network/model/genre_model.dart';
import 'package:moviesapp/network/model/movie_model.dart';
import 'package:moviesapp/ui/utils/info_type.dart';
import 'package:moviesapp/ui/utils/toast_helper.dart';

/// Controladora que maneja la lógica de funcionamiento de la vista del Home.
class HomeController extends GetxController {
  /// Controlador del  Campo de Texto para la búsqueda por Título
  TextEditingController searchTxtFieldController = TextEditingController();

  /// Variable que indica si se está cargando los Generos.
  var isLoadingGenres = false.obs;

  /// Variable que indica si hay un error a la hora de cargar los Generos.
  var isErrorGetGenres = false.obs;

  /// Listado de los Géneros de Películas
  List<GenreModel> get genres => _genres;
  List<GenreModel> _genres = [];

  /// Variable que indica si se está cargando las Películas más populares.
  var isLoadingPopularMovies = false.obs;

  /// Variable que indica si hay un error a la hora de cargar las Películas más populares.
  var isErrorGetPopularMovies = false.obs;

  /// Listado de las Películas más populares
  List<MovieModel> get popularMovies => _popularMovies;
  List<MovieModel> _popularMovies = [];

  @override
  void onInit() {
    super.onInit();
    print("Home onInit");
    getAllGenres();
    getAllPopularMovies();
  }

  /// Permite obtener desde la base de datos todas las imagenes capturadas por el usuario.
  Future<void> getAllGenres() async {
    isErrorGetGenres(false);
    isLoadingGenres(true);
    try {
      _genres = await ApiGenre.getAllGenres();
      print(genres);
      isErrorGetGenres(false);
      isLoadingGenres(false);
    } catch (e) {
      isErrorGetGenres(true);
      isLoadingGenres(false);
      ToastHelper.showCustomToast(
          message: e.toString(), infoType: InfoType.ERROR);
      print("Error al obtener los Generos: $e");
    }
  }

  /// Permite obtener desde la base de datos todas las imagenes capturadas por el usuario.
  Future<void> getAllPopularMovies() async {
    isErrorGetPopularMovies(false);
    isLoadingPopularMovies(true);
    try {
      _popularMovies = await ApiMovie.getAllPopularMovies();
      print(_popularMovies);
      isErrorGetPopularMovies(false);
      isLoadingPopularMovies(false);
    } catch (e) {
      isErrorGetPopularMovies(true);
      isLoadingPopularMovies(false);
      ToastHelper.showCustomToast(
          message: e.toString(), infoType: InfoType.ERROR);
      print("Error al obtener las Peliculas: $e");
    }
  }
}
