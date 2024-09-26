import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SearchByGenrePage extends StatefulWidget {
  const SearchByGenrePage({super.key});

  @override
  State<SearchByGenrePage> createState() => _SearchByGenrePageState();
}

class _SearchByGenrePageState extends State<SearchByGenrePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("Busqueda por Genero"),
      ),
    );
  }
}
