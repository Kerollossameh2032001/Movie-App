import 'package:dartz/dartz.dart';
import 'package:movie_app/movies/domain/entities/movie.dart';
import 'package:movie_app/movies/domain/entities/movie_details.dart';
import 'package:movie_app/movies/domain/entities/recommendation.dart';
import 'package:movie_app/movies/domain/usecase/get_recommendation_parameter.dart';

import '../../../core/error/failure.dart';
import '../usecase/get_movie_details_usecase.dart';

abstract class BaseMovieRepository {
  Future<Either<Failure,List<Movie>>> getNowPlaying();

  Future<Either<Failure,List<Movie>>> getPopularMovies();

  Future<Either<Failure,List<Movie>>> getTopRatedMovies();

  Future<Either<Failure,MovieDetails>> getMovieDetails(MovieDetailsParameter parameter);

  Future<Either<Failure,List<Recommendation>>> getRecommendation(RecommendationParameters parameter);
}
