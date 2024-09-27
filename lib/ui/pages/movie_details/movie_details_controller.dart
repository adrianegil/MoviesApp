import 'package:get/get.dart';
import 'package:moviesapp/data/dao/genre_dao.dart';
import 'package:moviesapp/data/entity/genre.dart';
import 'package:moviesapp/network/model/movie_model.dart';
import 'package:moviesapp/ui/utils/info_type.dart';
import 'package:moviesapp/ui/utils/toast_helper.dart';

/// Controladora que maneja la lógica de funcionamiento de la vista de Detalles de la Película.
class MovieDetailsController extends GetxController {
  /// Modelo de Dato correspondiente a la Película
  MovieModel? get movieModel => _movieModel;
  MovieModel? _movieModel;

  /// Listado de Géneros de la Pelicula
  var movieGenres = <Genre>[].obs;

  @override
  void onInit() {
    super.onInit();
    _movieModel = Get.arguments as MovieModel?;
    getAllMovieGenres();
  }

  /// Permite obtener desde la base de datos todas los géneros de la película.
  Future<void> getAllMovieGenres() async {
    try {
      movieGenres.value =
          await GenreDao.getAllGenresByIds(_movieModel!.genreIds!);
      print(movieGenres.value);
    } catch (e) {
      ToastHelper.showCustomToast(
          message: "unexpected_error_has_occurred".tr,
          infoType: InfoType.ERROR);
      print("Error al obtener los géneros de la BD: $e");
    }
  }
}
