import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/core/use_case/base_use_case.dart';
import 'package:movie_app/core/utils/enums.dart';
import 'package:movie_app/movies/domain/usecase/get_now_playing_movies_usecase.dart';
import 'package:movie_app/movies/domain/usecase/get_top_rated_movies_usecase.dart';
import 'package:movie_app/movies/presentation/controlers/movies_events.dart';
import 'package:movie_app/movies/presentation/controlers/movies_states.dart';

import '../../domain/usecase/get_popular_movies_usecase.dart';

class MovieBloc extends Bloc<MoviesEvent, MovieStates> {
  final GetNowPlayingMoviesUseCase getNowPlayingMoviesUseCase;
  final GetPopularMoviesUseCase getPopularMoviesUseCase;
  final GetTopRatedMoviesUseCase getTopRatedMoviesUseCase;

  MovieBloc(this.getNowPlayingMoviesUseCase, this.getPopularMoviesUseCase,
      this.getTopRatedMoviesUseCase)
      : super(const MovieStates()) {
    on<GetNowPlayingMoviesEvent>(_getNowPlayingMovies);

    on<GetPopularMoviesEvent>(_getPopularMovies);
    on<GetTopRatedMoviesEvent>(_getTopRatedMovies);
  }

  FutureOr<void> _getPopularMovies(event, emit) async {
    final result = await getPopularMoviesUseCase(const NoParameter());
    result.fold(
        (l) => emit(state.copyWith(
            popularMessage: l.message, popularState: RequestState.error)),
        (r) => emit(state.copyWith(
            popularMovie: r, popularState: RequestState.loaded)));
  }

  FutureOr<void> _getNowPlayingMovies(event, emit) async {
    final result = await getNowPlayingMoviesUseCase(const NoParameter());
    result.fold(
        (l) => emit(state.copyWith(
            nowPlayingMessage: l.message, nowPlayingState: RequestState.error)),
        (r) => emit(state.copyWith(
            nowPlayingMovie: r, nowPlayingState: RequestState.loaded)));
  }

  FutureOr<void> _getTopRatedMovies(
      GetTopRatedMoviesEvent event, Emitter<MovieStates> emit) async {
    final result = await getTopRatedMoviesUseCase(const NoParameter());
    result.fold(
        (l) => emit(state.copyWith(
            topRatedMessage: l.message, topRatedState: RequestState.error)),
        (r) => emit(state.copyWith(
            topRatedMovie: r, topRatedState: RequestState.loaded)));
  }
}
