import 'package:get_it/get_it.dart';
import 'package:movie_app/movies/data/data_source/movie_remote_data_source.dart';
import 'package:movie_app/movies/domain/repository/base_movie_repository.dart';
import 'package:movie_app/movies/domain/usecase/get_movie_details_usecase.dart';
import 'package:movie_app/movies/domain/usecase/get_recommendation_parameter.dart';
import 'package:movie_app/movies/presentation/controlers/movies_bloc.dart';
import '../../movies/data/repsitory/movie_repository.dart';
import '../../movies/domain/usecase/get_now_playing_movies_usecase.dart';
import '../../movies/domain/usecase/get_popular_movies_usecase.dart';
import '../../movies/domain/usecase/get_top_rated_movies_usecase.dart';
import '../../movies/presentation/controlers/movie_details_bloc.dart';

final sl = GetIt.instance;

class ServiceLocator {
  static void init() {
    ///BLOC
    sl.registerFactory(() => MovieBloc(sl(), sl(), sl()));
    sl.registerFactory(() => MovieDetailsBloc(sl(),sl()));

    ///USE_CASE
    sl.registerLazySingleton<GetNowPlayingMoviesUseCase>(
        () => GetNowPlayingMoviesUseCase(sl()));
    sl.registerLazySingleton<GetPopularMoviesUseCase>(
        () => GetPopularMoviesUseCase(sl()));
    sl.registerLazySingleton<GetTopRatedMoviesUseCase>(
        () => GetTopRatedMoviesUseCase(sl()));
    sl.registerLazySingleton<GetMovieDetailsUseCase>(
        () => GetMovieDetailsUseCase(sl()));

    sl.registerLazySingleton<GetRecommendationUseCase>(
            () => GetRecommendationUseCase(sl()));

    ///REPOSITORY
    sl.registerLazySingleton<BaseMovieRepository>(() => MovieRepository(sl()));

    ///DATA SOURCE
    sl.registerLazySingleton<BaseMovieRemoteDataSource>(
        () => MovieRemoteDataSource());
  }
}
