import 'package:get/get.dart';
import 'package:moviesapp/network/model/movie_model.dart';

/// Controladora que maneja la lógica de funcionamiento de la vista de Detalles de la Película.
class MovieDetailsController extends GetxController {
  /// Modelo de Dato correspondiente a la Pelicula
  MovieModel? get movieModel => _movieModel;
  MovieModel? _movieModel;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    _movieModel = Get.arguments as MovieModel?;
  }
}
