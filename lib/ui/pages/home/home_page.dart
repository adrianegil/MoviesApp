import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moviesapp/ui/pages/home/home_controller.dart';
import 'package:moviesapp/ui/pages/home/widgets/appbar_main.dart';
import 'package:moviesapp/ui/pages/home/widgets/movie_item_list.dart';
import 'package:moviesapp/ui/routes/app_routes.dart';
import 'package:moviesapp/ui/utils/info_type.dart';
import 'package:moviesapp/ui/utils/toast_helper.dart';
import 'package:moviesapp/ui/widgets/error_view.dart';
import 'package:moviesapp/ui/widgets/loading_view.dart';

import '../../styles/app_colors.dart';
import '../../styles/app_styles.dart';

/// Vista del Home.
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final controller = Get.put(HomeController());
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarMain(),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              Form(
                key: _formKey,
                child: Padding(
                  padding:
                      const EdgeInsets.only(top: 16, left: 16.0, right: 16.0),
                  child: TextFormField(
                    autofocus: false,
                    controller: controller.searchTxtFieldController,
                    decoration: InputDecoration(
                      contentPadding:
                          const EdgeInsets.only(left: 16, top: 16, bottom: 16),
                      enabledBorder: AppStyles.textFieldBorderNormal,
                      focusedBorder: AppStyles.textFieldBorderFocused,
                      errorBorder: AppStyles.textFieldBorderError,
                      focusedErrorBorder: AppStyles.textFieldBorderError,
                      floatingLabelStyle:
                          const TextStyle(color: AppColors.primaryColor),
                      label: Text("Buscar por Título"),
                      iconColor: AppColors.primaryColor,
                      suffixIcon: IconButton(
                        icon: Icon(Icons.search),
                        onPressed: () {
                          FocusScope.of(context).unfocus();
                          if (_formKey.currentState!.validate()) {
                                  Get.toNamed(AppRoutes.SEARCH_BY_TITLE,
                                arguments:
                                    controller.searchTxtFieldController.text);
                          }
                        },
                      ),
                    ),
                    keyboardType: TextInputType.text,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "required".tr;
                      }
                      return null;
                    },
                  ),
                ),
              ),
              SizedBox(height: 8),
              Text(
                "Géneros",
                style: TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 8),
              Obx(
                () => (controller.isLoadingGenres.isTrue)
                    ? const LoadingView()
                    : (controller.isErrorGetGenres.isTrue)
                        ? Container(
                            child: Center(
                              child: Column(
                                children: [
                                  Icon(Icons.error,
                                      size: 40, color: Colors.red),
                                  SizedBox(
                                    height: 8,
                                  ),
                                  Container(
                                    padding: EdgeInsets.only(
                                        left: 10, right: 10, bottom: 10),
                                    child: Text(
                                      "Error al Cargar los Géneros de las Peliculas",
                                      style: TextStyle(
                                        fontSize: 16,
                                        letterSpacing: 1,
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          )
                        : Container(
                            height: 40,
                            child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: controller.genres.length,
                                itemBuilder: (context, index) {
                                  return Padding(
                                    padding: const EdgeInsets.only(
                                        top: 2,
                                        bottom: 2,
                                        left: 8.0,
                                        right: 8.0),
                                    child: OutlinedButton(
                                        onPressed: () {
                                          Get.toNamed(AppRoutes.SEARCH_BY_GENRE,
                                              arguments:
                                                  controller.genres[index]);
                                        },
                                        child: Text(
                                            controller.genres[index].name!)),
                                  );
                                }),
                          ),
              ),
              SizedBox(height: 8),
              Text(
                "Peliculas mas Populares",
                style: TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 8),
              Obx(
                () => (controller.isLoadingPopularMovies.isTrue)
                    ? const LoadingView()
                    : (controller.isErrorGetPopularMovies.isTrue)
                        ? ErrorView("Fallo al obtener Peliculas")
                        : Container(
                            height: 390,
                            child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: controller.popularMovies.length,
                                itemBuilder: (context, index) {
                                  return MovieItemList(
                                    movieModel: controller.popularMovies[index],
                                    onTap: () {
                                      Get.toNamed(AppRoutes.MOVIE_DETAILS,
                                          arguments:
                                              controller.popularMovies[index]);
                                    },
                                  );
                                }),
                          ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
