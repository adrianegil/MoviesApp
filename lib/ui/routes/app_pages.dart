import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:moviesapp/network/model/genre_model.dart';
import 'package:moviesapp/network/model/movie_model.dart';
import 'package:moviesapp/ui/pages/movie_details/movie_details_page.dart';
import 'package:moviesapp/ui/pages/search_by_genre/search_by_genre_page.dart';
import 'package:moviesapp/ui/pages/search_by_title/search_by_title_page.dart';

import '../pages/home/home_page.dart';
import 'app_routes.dart';

/// Listado de pantallas de la app
class AppPages {
  static var list = [
    GetPage(
      name: AppRoutes.HOME,
      page: () => const HomePage(),
    ),
    GetPage(
      name: AppRoutes.MOVIE_DETAILS,
      page: () => const MovieDetailsPage(),
      arguments: (movie_model) => MovieModel,
    ),
    GetPage(
      name: AppRoutes.SEARCH_BY_TITLE,
      page: () => const SearchByTitlePage(),
      arguments: (title) => String,
    ),
    GetPage(
      name: AppRoutes.SEARCH_BY_GENRE,
      page: () => const SearchByGenrePage(),
      arguments: (genre) => GenreModel,
    ),
  ];
}
