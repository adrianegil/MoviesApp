import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:moviesapp/data/entity/genre.dart';

/// Item List correspondientes al Género de la Película
class GenreItemList extends StatelessWidget {
  Genre genre;
  final VoidCallback? onTap;

  GenreItemList({super.key, required this.genre, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: Container(
        alignment: Alignment.center,
        padding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 6.0),
        decoration: BoxDecoration(
          color: Colors.grey[300], // Fondo gris
          borderRadius: BorderRadius.circular(20), // Bordes circulares
        ),
        child: Text(
          genre.name,
          style: TextStyle(
            color: Colors.black,
            fontSize: 14.0,
          ),
        ),
      ),
    );
  }
}
