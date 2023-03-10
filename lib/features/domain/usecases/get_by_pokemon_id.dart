import '../entities/pokemon.dart';
import '../repositories/pokemon_repository.dart';
import '../../../core/error/failures.dart';
import '../../../core/usecases/usecase.dart';

import 'package:equatable/equatable.dart';
import 'package:fpdart/fpdart.dart';

class GetByPokemonId extends UseCase<Pokemon, PokemonIdParams> {
  final PokemonRepository repository;

  GetByPokemonId({required this.repository});

  @override
  Future<Either<Failure, Pokemon>> call(PokemonIdParams params) async {
    return await repository.getByPokemonId(params.id);
  }
}

class PokemonIdParams extends Equatable {
  final int id;

  const PokemonIdParams({required this.id});

  @override
  List<Object?> get props => [id];
}
