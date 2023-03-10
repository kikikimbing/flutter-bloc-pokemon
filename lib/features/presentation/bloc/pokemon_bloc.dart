import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:pokemon_app/features/domain/usecases/get_by_pokemon_id.dart';
import 'package:pokemon_app/features/domain/usecases/get_by_pokemon_name.dart';

import '../../domain/entities/pokemon.dart';

part 'pokemon_event.dart';
part 'pokemon_state.dart';

const String serverFailureMessage = 'Server Failure';

class PokemonBloc extends Bloc<PokemonEvent, PokemonState> {
  final GetByPokemonId getByPokemonId;
  final GetByPokemonName getByPokemonName;

  PokemonBloc(
    this.getByPokemonId,
    this.getByPokemonName,
  ) : super(Empty()) {
    on<GetPokemonById>(_onGetPokemonById);
    on<GetPokemonByName>(_onGetPokemonByName);
  }

  void _onGetPokemonById(
    GetPokemonById event,
    Emitter<PokemonState> emit,
  ) async {
    emit(Loading());
    final response = await getByPokemonId(PokemonIdParams(id: event.pokemonId));
    response.fold(
      (failure) => emit(Error(message: serverFailureMessage)),
      (pokemon) => emit(Loaded(pokemon: pokemon)),
    );
    return;
  }

  void _onGetPokemonByName(
    GetPokemonByName event,
    Emitter<PokemonState> emit,
  ) async {
    emit(Loading());
    final response = await getByPokemonName(
        PokemonNameParams(pokemonName: event.pokemonName));
    response.fold(
      (failure) => emit(Error(message: serverFailureMessage)),
      (pokemon) => emit(Loaded(pokemon: pokemon)),
    );
  }
}
