import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moviesapp/ui/pages/search_by_genre/search_by_genre_controller.dart';
import 'package:moviesapp/ui/pages/search_by_genre/widgets/movie_by_genre_item_list.dart';
import 'package:moviesapp/ui/routes/app_routes.dart';
import 'package:moviesapp/ui/widgets/appbar_normal.dart';
import 'package:moviesapp/ui/widgets/empty_view.dart';
import 'package:moviesapp/ui/widgets/error_view.dart';
import 'package:moviesapp/ui/widgets/loading_view.dart';

class SearchByGenrePage extends StatefulWidget {
  const SearchByGenrePage({super.key});

  @override
  State<SearchByGenrePage> createState() => _SearchByGenrePageState();
}

class _SearchByGenrePageState extends State<SearchByGenrePage> {
  final controller = Get.put(SearchByGenreController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarNormal(
        title: controller.genreModel?.name,
      ),
      body: Obx(
        () => (controller.isLoadingMovies.isTrue)
            ? const LoadingView()
            : (controller.isErrorGetMovies.isTrue)
                ? ErrorView("Fallo al obtener Peliculas",onTap: controller.getAllMoviesByGenre)
                : controller.moviesByGenre.isEmpty
                    ? EmptyView("No hay Peliculas para mostrar")
                    : ListView.builder(
                        scrollDirection: Axis.vertical,
                        itemCount: controller.moviesByGenre.length,
                        itemBuilder: (context, index) {
                          return Container(
                            width: MediaQuery.of(context).size.width < 500
                                ? MediaQuery.of(context).size.width
                                : 50,
                            child: MovieByGenreItemList(
                              movieModel: controller.moviesByGenre[index],
                              onTap: () {
                                Get.toNamed(AppRoutes.MOVIE_DETAILS,
                                    arguments:
                                        controller.moviesByGenre[index]);
                              },
                            ),
                          );
                        }),
      ),
    );
  }
}
