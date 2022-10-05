import 'package:dartz/dartz.dart';
import 'package:movie_app/core/error/execptions.dart';
import 'package:movie_app/core/error/failure.dart';
import 'package:movie_app/movies/data/data_source/movie_remote_data_source.dart';
import 'package:movie_app/movies/domain/entities/movie.dart';
import 'package:movie_app/movies/domain/entities/movie_details.dart';
import 'package:movie_app/movies/domain/entities/recommendation.dart';
import 'package:movie_app/movies/domain/repository/base_movie_repository.dart';
import 'package:movie_app/movies/domain/usecase/get_movie_details_usecase.dart';
import 'package:movie_app/movies/domain/usecase/get_recommendation_parameter.dart';

class MovieRepository extends BaseMovieRepository {
  final BaseMovieRemoteDataSource baseMovieRemoteDataBaseSource;

  MovieRepository(this.baseMovieRemoteDataBaseSource);

  @override
  Future<Either<Failure, List<Movie>>> getNowPlaying() async {
    final result = await baseMovieRemoteDataBaseSource.getNewPlayingMovie();
    try {
      return Right(result);
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, List<Movie>>> getPopularMovies() async {
    final result = await baseMovieRemoteDataBaseSource.getPopularMovie();
    try {
      return Right(result);
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, List<Movie>>> getTopRatedMovies() async {
    final result = await baseMovieRemoteDataBaseSource.getTopRatedMovie();
    try {
      return Right(result);
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, MovieDetails>> getMovieDetails(
      MovieDetailsParameter parameter) async {
    final result =
        await baseMovieRemoteDataBaseSource.getMovieDetails(parameter);
    try {
      return Right(result);
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, List<Recommendation>>> getRecommendation(RecommendationParameters parameter) async{
    final result =
        await baseMovieRemoteDataBaseSource.getRecommendation(parameter);
    try {
      return Right(result);
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorMessageModel.statusMessage));
    }
  }
}
