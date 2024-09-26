import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moviesapp/ui/pages/search_by_genre/search_by_genre_controller.dart';
import 'package:moviesapp/ui/pages/search_by_title/search_by_title_controller.dart';
import 'package:moviesapp/ui/widgets/appbar_normal.dart';

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
      body: Center(
        child: Text("Busqueda por Genero"),
      ),
    );
  }
}
