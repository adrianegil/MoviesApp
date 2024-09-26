import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moviesapp/ui/pages/search_by_genre/search_by_genre_controller.dart';
import 'package:moviesapp/ui/pages/search_by_title/search_by_title_controller.dart';
import 'package:moviesapp/ui/widgets/appbar_normal.dart';

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
          title: controller.title,
        ),
      body: Center(
        child: Text("Busqueda por titulo"),
      ),
    );
  }
}
