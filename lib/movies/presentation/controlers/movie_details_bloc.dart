import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/core/utils/enums.dart';
import 'package:movie_app/movies/domain/entities/movie_details.dart';
import 'package:movie_app/movies/domain/entities/recommendation.dart';
import 'package:movie_app/movies/domain/usecase/get_movie_details_usecase.dart';
import 'package:movie_app/movies/domain/usecase/get_recommendation_parameter.dart';

part 'movie_details_event.dart';

part 'movie_details_state.dart';

class MovieDetailsBloc extends Bloc<MovieDetailsEvent, MovieDetailsState> {
  MovieDetailsBloc(this.getMovieDetailsUseCase, this.getRecommendationUseCase)
      : super(const MovieDetailsState()) {
    on<GetMovieDetailsEvent>(_getMovieDetails);
    on<GetMovieRecommendationEvent>(_getRecommendations);
  }

  final GetMovieDetailsUseCase getMovieDetailsUseCase;
  final GetRecommendationUseCase getRecommendationUseCase;

  FutureOr<void> _getMovieDetails(
      GetMovieDetailsEvent event, Emitter<MovieDetailsState> emit) async {
    final result =
        await getMovieDetailsUseCase(MovieDetailsParameter(movieId: event.id));
    result.fold(
        (l) => emit(state.copyWith(
            movieDetailMessage: l.message,
            movieDetailState: RequestState.error)),
        (r) {
          print('image Path ${r.backdropPath}');
          emit(state.copyWith(
            movieDetail: r, movieDetailState: RequestState.loaded));
        });
  }

  FutureOr<void> _getRecommendations(
      GetMovieRecommendationEvent event, Emitter<MovieDetailsState> emit) async {
    final result =
        await getRecommendationUseCase(RecommendationParameters(event.id));
    result.fold(
        (l) => emit(state.copyWith(
            recommendationMessage: l.message,
            recommendationState: RequestState.error)),
        (r) => emit(state.copyWith(
            recommendations: r, recommendationState: RequestState.loaded)));
  }
}
