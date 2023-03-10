part of 'pokemon_bloc.dart';

abstract class PokemonEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class GetPokemonById extends PokemonEvent {
  final int pokemonId;

  GetPokemonById(this.pokemonId);
}

class GetPokemonByName extends PokemonEvent {
  final String pokemonName;

  GetPokemonByName(this.pokemonName);
}
