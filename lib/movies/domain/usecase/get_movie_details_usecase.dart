import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:movie_app/core/error/failure.dart';
import 'package:movie_app/core/use_case/base_use_case.dart';
import 'package:movie_app/movies/domain/entities/movie_details.dart';
import 'package:movie_app/movies/domain/repository/base_movie_repository.dart';

class GetMovieDetailsUseCase extends BaseUseCase<MovieDetails,MovieDetailsParameter> {
  final BaseMovieRepository baseMovieRepository;

  GetMovieDetailsUseCase(this.baseMovieRepository);

  @override
  Future<Either<Failure, MovieDetails>> call(MovieDetailsParameter parameter) async{
    return await baseMovieRepository.getMovieDetails(parameter);
  }
}

class MovieDetailsParameter extends Equatable{
  final int movieId;

  const MovieDetailsParameter({required this.movieId});
  @override
  List<Object?> get props => [movieId];
}
