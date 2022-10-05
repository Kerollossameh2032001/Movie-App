import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:movie_app/core/error/failure.dart';
import 'package:movie_app/core/use_case/base_use_case.dart';
import 'package:movie_app/movies/domain/entities/recommendation.dart';
import 'package:movie_app/movies/domain/repository/base_movie_repository.dart';

class GetRecommendationUseCase
    extends BaseUseCase<List<Recommendation>, RecommendationParameters> {
  final BaseMovieRepository baseMovieRepository;

  GetRecommendationUseCase(this.baseMovieRepository);

  @override
  Future<Either<Failure, List<Recommendation>>> call(
      RecommendationParameters parameter) async {
    return await baseMovieRepository.getRecommendation(parameter);
  }
}

class RecommendationParameters extends Equatable {
  final int movieId;

  const RecommendationParameters(this.movieId);

  @override
  List<Object> get props => [movieId];
}
