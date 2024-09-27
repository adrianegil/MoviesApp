/// Entidad que representa un Género de una Pelicula.
class Genre {
  final int? id;
  final String name;

  Genre({
    this.id,
    required this.name,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
    };
  }

  factory Genre.fromMap(Map<String, dynamic> map) {
    return Genre(
      id: map['id'],
      name: map['name'],
    );
  }

  @override
  String toString() {
    return 'Genre{id: $id, name: $name}';
  }
}
