import 'package:get/get.dart';
import 'package:moviesapp/network/api/api_movie.dart';
import 'package:moviesapp/network/model/genre_model.dart';
import 'package:moviesapp/network/model/movie_model.dart';
import 'package:moviesapp/ui/utils/info_type.dart';
import 'package:moviesapp/ui/utils/toast_helper.dart';

/// Controladora que maneja la lógica de funcionamiento de la vista de Búsqueda por Titulo.
class SearchByGenreController extends GetxController {
  /// Modelo de Dato correspondiente al Genero de la Pelicula
  GenreModel? get genreModel => _genreModel;
  GenreModel? _genreModel;

  /// Variable que indica si se está cargando las Películas más populares.
  var isLoadingMovies = false.obs;

  /// Variable que indica si hay un error a la hora de cargar las Películas más populares.
  var isErrorGetMovies = false.obs;

  /// Listado de las Películas más populares
  List<MovieModel> get moviesByGenre => _moviesByGenre;
  List<MovieModel> _moviesByGenre = [];

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    _genreModel = Get.arguments as GenreModel?;
    getAllMoviesByGenre();
  }

  /// Permite obtener desde la base de datos todas las imagenes capturadas por el usuario.
  Future<void> getAllMoviesByGenre() async {
    isErrorGetMovies(false);
    isLoadingMovies(true);
    try {
      _moviesByGenre = await ApiMovie.getAllMoviesByGenre(_genreModel!.id!);
      print(_moviesByGenre);
      isErrorGetMovies(false);
      isLoadingMovies(false);
    } catch (e) {
      isErrorGetMovies(true);
      isLoadingMovies(false);
      ToastHelper.showCustomToast(
          message: e.toString(), infoType: InfoType.ERROR);
      print("Error al obtener las Peliculas por Genero: $e");
    }
  }
}
