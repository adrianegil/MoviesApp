import 'package:moviesapp/data/database_helper.dart';
import 'package:moviesapp/data/entity/genre.dart';
import 'package:moviesapp/network/model/genre_model.dart';
import 'package:sqflite/sqflite.dart';

/// Clase que permite encapsular las operaciones de acceso a datos relacionadas con los géneros de películas.
class GenreDao {
  /// Permite insertar en la base de datos interna de la app los géneros de las películas.
  static Future<void> insertAllGenres(List<GenreModel> genres) async {
    final db = await DatabaseHelper().database;
    // Usamos un batch para optimizar la inserción múltiple
    var batch = db.batch();
    for (var genre in genres) {
      batch.insert(
        'genre',
        genre.toGenreEntityMap(),
        conflictAlgorithm: ConflictAlgorithm.replace,
      );
    }
    // Ejecutamos todas las inserciones en una sola transacción
    await batch.commit(
        noResult:
            true); // noResult: true para mejorar el rendimiento si no necesitas el resultado
  }

  /// Permite obtener de la base de datos interna de la app los géneros que coincidan con una lista de IDs.
  static Future<List<Genre>> getAllGenresByIds(List<int> ids) async {
    Database db = await DatabaseHelper.instance.database;
    // Si la lista de IDs está vacía, retorna una lista vacía
    if (ids.isEmpty) {
      return [];
    }
    // Convertimos la lista de IDs en una cadena de IDs separada por comas para la consulta SQL
    String idsString = ids.join(',');
    // Ejecutamos la consulta filtrando por los IDs
    final List<Map<String, Object?>> genres = await db.query(
      'genre',
      where: 'id IN ($idsString)', // Filtro por IDs
      orderBy: 'id DESC',
    );
    // Convertimos el resultado de la consulta en una lista de objetos Genre
    return List.generate(genres.length, (index) {
      return Genre(
        id: genres[index]['id'] as int,
        name: genres[index]['name'] as String,
      );
    });
  }
}
