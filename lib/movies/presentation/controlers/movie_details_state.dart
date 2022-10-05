part of 'movie_details_bloc.dart';

class MovieDetailsState extends Equatable {
  const MovieDetailsState({
    this.movieDetail,
    this.movieDetailState = RequestState.loading,
    this.movieDetailMessage = '',
    this.recommendations = const [],
    this.recommendationState = RequestState.loading,
    this.recommendationMessage = '',
  });

  final MovieDetails? movieDetail;
  final RequestState movieDetailState;
  final String movieDetailMessage;
  final List<Recommendation> recommendations;
  final RequestState recommendationState;
  final String recommendationMessage;

  MovieDetailsState copyWith({
    MovieDetails? movieDetail,
    RequestState? movieDetailState,
    String? movieDetailMessage,
    List<Recommendation>? recommendations,
    RequestState? recommendationState,
    String? recommendationMessage,
  }) =>
      MovieDetailsState(
        movieDetail: movieDetail ?? this.movieDetail,
        movieDetailMessage: movieDetailMessage ?? this.movieDetailMessage,
        movieDetailState: movieDetailState ?? this.movieDetailState,
        recommendations: recommendations ?? this.recommendations,
        recommendationMessage:
            recommendationMessage ?? this.recommendationMessage,
        recommendationState: recommendationState ?? this.recommendationState,
      );

  @override
  List<Object?> get props => [
        movieDetail,
        movieDetailState,
        movieDetailMessage,
        recommendations,
        recommendationState,
        recommendationMessage,
      ];
}
