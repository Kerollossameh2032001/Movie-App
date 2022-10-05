import 'package:equatable/equatable.dart';
import 'package:movie_app/core/utils/enums.dart';
import 'package:movie_app/movies/domain/entities/movie.dart';

class MovieStates extends Equatable {
  ///Now Playing Movies
  final List<Movie> nowPlayingMovie;
  final RequestState nowPlayingState;
  final String nowPlayingMessage;

  ///Popular Movies
  final List<Movie> popularMovie;
  final RequestState popularState;
  final String popularMessage;

  ///Top Rated Movies
  final List<Movie> topRatedMovie;
  final RequestState topRatedState;
  final String topRatedMessage;

  const MovieStates({
    this.nowPlayingMovie = const [],
    this.nowPlayingState = RequestState.loading,
    this.nowPlayingMessage = '',
    this.popularMovie = const [],
    this.popularState = RequestState.loading,
    this.popularMessage = '',
    this.topRatedMovie = const [],
    this.topRatedState = RequestState.loading,
    this.topRatedMessage = '',
  });

  MovieStates copyWith({
    List<Movie>? nowPlayingMovie,
    RequestState? nowPlayingState,
    String? nowPlayingMessage,
    List<Movie>? popularMovie,
    RequestState? popularState,
    String? popularMessage,
    List<Movie>? topRatedMovie,
    RequestState? topRatedState,
    String? topRatedMessage,
  }) =>
      MovieStates(
        ///Popular Movies
        nowPlayingState: nowPlayingState ?? this.nowPlayingState,
        nowPlayingMovie: nowPlayingMovie ?? this.nowPlayingMovie,
        nowPlayingMessage: nowPlayingMessage ?? this.nowPlayingMessage,

        ///Popular Movies
        popularMessage: popularMessage ?? this.popularMessage,
        popularMovie: popularMovie ?? this.popularMovie,
        popularState: popularState ?? this.popularState,

        ///Top Rated Movies
        topRatedMessage: topRatedMessage ?? this.topRatedMessage,
        topRatedMovie: topRatedMovie ?? this.topRatedMovie,
        topRatedState: topRatedState ?? this.popularState,
      );

  @override
  List<Object?> get props => [
        nowPlayingMovie,
        nowPlayingState,
        nowPlayingMessage,
        popularMovie,
        popularState,
        popularMessage,
        topRatedMovie,
        topRatedState,
        topRatedMessage,
      ];
}
