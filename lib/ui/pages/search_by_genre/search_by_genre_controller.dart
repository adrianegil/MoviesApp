import 'package:get/get.dart';
import 'package:moviesapp/network/api/api_movie.dart';
import 'package:moviesapp/network/model/genre_model.dart';
import 'package:moviesapp/network/model/movie_model.dart';
import 'package:moviesapp/ui/utils/info_type.dart';
import 'package:moviesapp/ui/utils/toast_helper.dart';

/// Controladora que maneja la lógica de funcionamiento de la vista de Búsqueda por Género.
class SearchByGenreController extends GetxController {
  /// Modelo de Dato correspondiente al Género de la Pelicula
  GenreModel? get genreModel => _genreModel;
  GenreModel? _genreModel;

  /// Variable que indica si se está cargando las Películas .
  var isLoadingMovies = false.obs;

  /// Variable que indica si hay un error a la hora de cargar las Películas.
  var isErrorGetMovies = false.obs;

  /// Listado de las Películas por Género
  List<MovieModel> get moviesByGenre => _moviesByGenre;
  List<MovieModel> _moviesByGenre = [];

  @override
  void onInit() {
    super.onInit();
    _genreModel = Get.arguments as GenreModel?;
    getAllMoviesByGenre();
  }

  /// Permite obtener el listado de las Películas por Género.
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
      print("Error al obtener las Peliculas por Género: $e");
    }
  }
}
