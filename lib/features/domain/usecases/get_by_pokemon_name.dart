import '../entities/pokemon.dart';
import '../repositories/pokemon_repository.dart';
import '../../../core/error/failures.dart';
import '../../../core/usecases/usecase.dart';

import 'package:equatable/equatable.dart';
import 'package:fpdart/fpdart.dart';

class GetByPokemonName extends UseCase<Pokemon, PokemonNameParams> {
  final PokemonRepository repository;

  GetByPokemonName({required this.repository});

  @override
  Future<Either<Failure, Pokemon>> call(PokemonNameParams params) async {
    return await repository.getByPokemonName(params.pokemonName);
  }
}

class PokemonNameParams extends Equatable {
  final String pokemonName;

  const PokemonNameParams({required this.pokemonName});

  @override
  List<Object?> get props => [pokemonName];
}
