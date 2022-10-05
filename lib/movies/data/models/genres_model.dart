import 'package:movie_app/movies/domain/entities/genres.dart';

class GenresModel extends Genres {
  const GenresModel({required super.name, required super.id});

  factory GenresModel.formJson(Map<String, dynamic> json) => GenresModel(
        name: json['name'],
        id: json['id'],
      );
}
