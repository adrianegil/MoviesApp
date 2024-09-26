import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SearchByTitlePage extends StatefulWidget {
  const SearchByTitlePage({super.key});

  @override
  State<SearchByTitlePage> createState() => _SearchByTitlePageState();
}

class _SearchByTitlePageState extends State<SearchByTitlePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("Busqueda por titulo"),
      ),
    );
  }
}
