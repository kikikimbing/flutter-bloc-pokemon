import 'package:fpdart/fpdart.dart';

import '../../../core/error/failures.dart';
import '../entities/pokemon.dart';

abstract class PokemonRepository {
  Future<Either<Failure, Pokemon>> getByPokemonId(int number);
  Future<Either<Failure, Pokemon>> getByPokemonName(String pokemonName);
}
