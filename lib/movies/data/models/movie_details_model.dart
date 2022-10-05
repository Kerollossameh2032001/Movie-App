import 'package:movie_app/movies/data/models/genres_model.dart';
import 'package:movie_app/movies/domain/entities/movie_details.dart';

class MovieDetailsModel extends MovieDetails {
  const MovieDetailsModel({
    required super.backdropPath,
    required super.id,
    required super.overview,
    required super.releaseDate,
    required super.runtime,
    required super.title,
    required super.voteAverage,
    required super.genres,
  });

  factory MovieDetailsModel.fromJson(Map<String, dynamic> json) =>
      MovieDetailsModel(
        backdropPath: json['backdrop_path'],
        id: json['id'],
        overview: json['overview'],
        releaseDate: json['release_date'],
        runtime: json['runtime'],
        title: json['title'],
        voteAverage: json['vote_average'].toDouble(),
        genres: List<GenresModel>.from(
            json['genres'].map((element) => GenresModel.formJson(element))),
      );
}
