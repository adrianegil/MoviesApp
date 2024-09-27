import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:moviesapp/data/dao/genre_dao.dart';
import 'package:moviesapp/network/api/api_genre.dart';
import 'package:moviesapp/network/api/api_movie.dart';
import 'package:moviesapp/network/model/genre_model.dart';
import 'package:moviesapp/network/model/movie_model.dart';

/// Controladora que maneja la lógica de funcionamiento de la vista del Home.
class HomeController extends GetxController {
  /// Controlador del  Campo de Texto para la búsqueda por Título
  TextEditingController searchTxtFieldController = TextEditingController();

  /// Variable que indica si se está cargando los Géneros de las Películas.
  var isLoadingGenres = false.obs;

  /// Variable que indica si hay un error a la hora de cargar los Géneros de las Películas.
  var isErrorGetGenres = false.obs;

  /// Listado de los Géneros de Películas
  List<GenreModel> get genres => _genres;
  List<GenreModel> _genres = [];

  /// Variable que indica si se está cargando las Películas más Populares.
  var isLoadingPopularMovies = false.obs;

  /// Variable que indica si hay un error a la hora de cargar las Películas más Populares.
  var isErrorGetPopularMovies = false.obs;

  /// Listado de las Películas más populares
  List<MovieModel> get popularMovies => _popularMovies;
  List<MovieModel> _popularMovies = [];

  /// Variable que indica si se está cargando las Películas mejor Valoradas.
  var isLoadingTopRatedMovies = false.obs;

  /// Variable que indica si hay un error a la hora de cargar las Películas mejor Valoradas.
  var isErrorTopRatedMovies = false.obs;

  /// Listado de las Películas más populares
  List<MovieModel> get topRatedMovies => _topRatedMovies;
  List<MovieModel> _topRatedMovies = [];

  @override
  void onInit() {
    super.onInit();
    print("Home onInit");
    init();
  }

  /// Permite obtener todos los Géneros de las Películas.
  Future<void> getAllGenres() async {
    isErrorGetGenres(false);
    isLoadingGenres(true);
    try {
      _genres = await ApiGenre.getAllGenres();
      print(genres);
      GenreDao.insertAllGenres(genres);
      isErrorGetGenres(false);
      isLoadingGenres(false);
    } catch (e) {
      isErrorGetGenres(true);
      isLoadingGenres(false);
      print("Error al obtener los Géneros: $e");
    }
  }

  /// Permite obtener las Películas más Populares.
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
      print("Error al obtener las Películas más Populares: $e");
    }
  }

  /// Permite obtener las Películas mejor Valoradas.
  Future<void> getAllTopRatedMovies() async {
    isErrorTopRatedMovies(false);
    isLoadingTopRatedMovies(true);
    try {
      _topRatedMovies = await ApiMovie.getAllTopRatedMovies();
      print(_popularMovies);
      isErrorTopRatedMovies(false);
      isLoadingTopRatedMovies(false);
    } catch (e) {
      isErrorTopRatedMovies(true);
      isLoadingTopRatedMovies(false);
      print("Error al obtener las Peliculas mejor Valoradas: $e");
    }
  }

  /// Realizar las peticiones necesarias para mostrar en la información obtenida en la vista
  void init() {
    getAllGenres();
    getAllPopularMovies();
    getAllTopRatedMovies();
  }
}
