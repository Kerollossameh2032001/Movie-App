import 'package:movie_app/movies/domain/entities/recommendation.dart';

class RecommendationModel extends Recommendation {
  const RecommendationModel({
    super.backdropPath,
    required super.id,
  });

  factory RecommendationModel.fromJson(Map<String, dynamic> json) =>
      RecommendationModel(
        backdropPath: json['backdrop_path'] ??
            "https://ehelperteam.com/wp-content/uploads/2019/09/Broken-images.png",
        id: json['id'],
      );
}
