import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moviesapp/ui/pages/search_by_genre/search_by_genre_controller.dart';
import 'package:moviesapp/ui/pages/search_by_title/search_by_title_controller.dart';
import 'package:moviesapp/ui/pages/search_by_title/widgets/movieby_title_item_list.dart';
import 'package:moviesapp/ui/routes/app_routes.dart';
import 'package:moviesapp/ui/widgets/appbar_normal.dart';
import 'package:moviesapp/ui/widgets/empty_view.dart';
import 'package:moviesapp/ui/widgets/error_view.dart';
import 'package:moviesapp/ui/widgets/loading_view.dart';

/// Vista de Búsqueda de Películas por Título
class SearchByTitlePage extends StatefulWidget {
  const SearchByTitlePage({super.key});

  @override
  State<SearchByTitlePage> createState() => _SearchByTitlePageState();
}

class _SearchByTitlePageState extends State<SearchByTitlePage> {
  final controller = Get.put(SearchByTitleController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarNormal(
        title: '${"search".tr}: "${controller.title}"',
      ),
      body: Obx(
        () => (controller.isLoadingMovies.isTrue)
            ? const LoadingView()
            : (controller.isErrorGetMovies.isTrue)
                ? ErrorView(
                    "failed_to_get_movies".tr,
                    onTap: controller.getAllMoviesByTitle,
                  )
                : controller.moviesByTitle.isEmpty
                    ? EmptyView("there_are_no_movies_to_show".tr)
                    : GridView.extent(
                      maxCrossAxisExtent: 250,
                      padding: EdgeInsets.all(2),
                      mainAxisSpacing: 2,
                      crossAxisSpacing: 2,
                      children: List.generate(
                          controller.moviesByTitle.length, (index) {
                        return MovieByTitleItemList(
                            movieModel: controller.moviesByTitle[index],
                            onTap: () {
                              Get.toNamed(AppRoutes.MOVIE_DETAILS,
                                  arguments:
                                      controller.moviesByTitle[index]);
                            });
                      }),
                    ),
      ),
    );
  }
}
