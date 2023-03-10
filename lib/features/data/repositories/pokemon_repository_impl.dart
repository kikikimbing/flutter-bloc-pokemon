import 'package:pokemon_app/features/domain/entities/pokemon.dart';

import '../datasource/pokemon_remote_data_source.dart';
import '../../domain/repositories/pokemon_repository.dart';
import '../../../core/error/failures.dart';

import 'package:fpdart/fpdart.dart';

typedef _GetPokemon = Future<Pokemon> Function();

class PokemonRepositoryImpl extends PokemonRepository {
  final PokemonRemoteDataSource remoteDataSource;

  PokemonRepositoryImpl({required this.remoteDataSource});

  @override
  Future<Either<Failure, Pokemon>> getByPokemonId(int number) async {
    return await _pokemonGetter(() => remoteDataSource.getByPokemonId(number));
  }

  @override
  Future<Either<Failure, Pokemon>> getByPokemonName(String pokemonName) async {
    return await _pokemonGetter(
        () => remoteDataSource.getByPokemonName(pokemonName));
  }

  Future<Either<Failure, Pokemon>> _pokemonGetter(
    _GetPokemon getPokemon,
  ) async =>
      TaskEither.tryCatch(
        () async => await getPokemon(),
        (_, __) => ServerFailure(),
      ).run();

  // Future<Either<Failure, Pokemon>> _pokemonGetter(
  //     _GetPokemon getPokemon) async {
  //   try {
  //     final pokemonRemote = await getPokemon();
  //     return Right(pokemonRemote);
  //   } on ServerException {
  //     return Left(ServerFailure());
  //   }
  // }
}
