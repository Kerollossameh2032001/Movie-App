import 'package:dio/dio.dart';
import 'package:movie_app/core/error/execptions.dart';
import 'package:movie_app/core/network/api_constance.dart';
import 'package:movie_app/core/network/error_message_model.dart';
import 'package:movie_app/movies/data/models/movie_details_model.dart';
import 'package:movie_app/movies/data/models/movie_model.dart';
import 'package:movie_app/movies/data/models/recommendation_model.dart';
import 'package:movie_app/movies/domain/usecase/get_movie_details_usecase.dart';
import 'package:movie_app/movies/domain/usecase/get_recommendation_parameter.dart';

abstract class BaseMovieRemoteDataSource {
  Future<List<MovieModel>> getNewPlayingMovie();

  Future<List<MovieModel>> getPopularMovie();

  Future<List<MovieModel>> getTopRatedMovie();

  Future<MovieDetailsModel> getMovieDetails(MovieDetailsParameter parameter);

  Future<List<RecommendationModel>> getRecommendation(
      RecommendationParameters parameter);
}

class MovieRemoteDataSource extends BaseMovieRemoteDataSource {
  @override
  Future<List<MovieModel>> getNewPlayingMovie() async {
    var response = await Dio().get(ApiConstance.nowPlayingMoviesPath);
    if (response.statusCode == 200) {
      return List<MovieModel>.from((response.data['results'] as List).map(
        (e) => MovieModel.fromJson(e),
      ));
    } else {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromJson(response.data),
      );
    }
  }

  @override
  Future<List<MovieModel>> getPopularMovie() async {
    var response = await Dio().get(ApiConstance.popularMoviesPath);
    if (response.statusCode == 200) {
      return List<MovieModel>.from((response.data['results'] as List).map(
        (e) => MovieModel.fromJson(e),
      ));
    } else {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromJson(response.data),
      );
    }
  }

  @override
  Future<List<MovieModel>> getTopRatedMovie() async {
    var response = await Dio().get(ApiConstance.topRatedMoviesPath);
    if (response.statusCode == 200) {
      return List<MovieModel>.from((response.data['results'] as List).map(
        (e) => MovieModel.fromJson(e),
      ));
    } else {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromJson(response.data),
      );
    }
  }

  @override
  Future<MovieDetailsModel> getMovieDetails(
      MovieDetailsParameter parameter) async {
    var response =
        await Dio().get(ApiConstance.movieDetailsPath(parameter.movieId));
    if (response.statusCode == 200) {
      return MovieDetailsModel.fromJson(response.data);
    } else {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromJson(response.data),
      );
    }
  }

  @override
  Future<List<RecommendationModel>> getRecommendation(
      RecommendationParameters parameter) async {
    final response =
        await Dio().get(ApiConstance.recommendationPath(parameter.movieId));
    if (response.statusCode == 200) {
      return List<RecommendationModel>.from(
          (response.data['results'] as List).map(
        (e) => RecommendationModel.fromJson(e),
      ));
    } else {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromJson(response.data),
      );
    }
  }
}
