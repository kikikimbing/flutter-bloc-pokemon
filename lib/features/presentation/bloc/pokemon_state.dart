part of 'pokemon_bloc.dart';

abstract class PokemonState extends Equatable {
  @override
  List<Object> get props => [];
}

class Empty extends PokemonState {}

class Loading extends PokemonState {}

class Loaded extends PokemonState {
  final Pokemon pokemon;

  Loaded({required this.pokemon});
}

class Error extends PokemonState {
  final String message;

  Error({required this.message});
}
