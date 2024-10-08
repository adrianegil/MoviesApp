/// Modelo de datos correspondientes a los Géneros de las peliculas
class GenreModel {
  int? id;
  String? name;

  GenreModel({this.id, this.name});

  GenreModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    return data;
  }

  Map<String, dynamic> toGenreEntityMap() {
    return {
      'id': id,
      'name': name,
    };
  }

  @override
  String toString() {
    return 'GenreModel{id: $id, name: $name}';
  }
}
