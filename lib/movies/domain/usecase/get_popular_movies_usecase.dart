import 'package:dartz/dartz.dart';
import 'package:movie_app/core/error/failure.dart';
import 'package:movie_app/core/use_case/base_use_case.dart';
import 'package:movie_app/movies/domain/entities/movie.dart';
import 'package:movie_app/movies/domain/repository/base_movie_repository.dart';

class GetPopularMoviesUseCase extends BaseUseCase<List<Movie>, NoParameter> {
  final BaseMovieRepository baseMovieRepository;

  GetPopularMoviesUseCase(this.baseMovieRepository);

  @override
  Future<Either<Failure, List<Movie>>> call(NoParameter parameter) async {
    return await baseMovieRepository.getPopularMovies();
  }
}
