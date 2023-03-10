import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:mockito/mockito.dart';
import 'package:pokemon_app/core/error/failures.dart';
import 'package:pokemon_app/features/domain/entities/pokemon.dart';
import 'package:pokemon_app/features/domain/usecases/get_by_pokemon_id.dart';
import 'package:pokemon_app/features/domain/usecases/get_by_pokemon_name.dart';
import 'package:pokemon_app/features/presentation/bloc/bloc.dart';
import 'package:mockito/annotations.dart';
import './pokemon_bloc_test.mocks.dart';

@GenerateMocks([
  GetByPokemonId,
  GetByPokemonName,
])
void main() {
  late PokemonBloc tBloc;
  late MockGetByPokemonId mockGetByPokemonId;
  late MockGetByPokemonName mockGetByPokemonName;

  setUp(() {
    mockGetByPokemonId = MockGetByPokemonId();
    mockGetByPokemonName = MockGetByPokemonName();
    tBloc = PokemonBloc(mockGetByPokemonId, mockGetByPokemonName);
  });

  tearDown(() {
    tBloc.close();
  });

  test(
    'initialState should be Empty',
    () async {
      // assert
      expect(tBloc.state, equals(Empty()));
    },
  );

  group('GetByPokemonId', () {
    const tPokemonId = 1;
    const tPokemon = Pokemon(
      name: 'Bulbasaur',
      height: 10,
      weight: 10,
      image: "www.google.com/images",
    );
    const params = PokemonIdParams(id: tPokemonId);

    blocTest(
      'should emit Loading then Loaded state if bloc is success',
      build: () {
        when(mockGetByPokemonId(params))
            .thenAnswer((_) async => const Right(tPokemon));
        return tBloc;
      },
      act: (PokemonBloc tBloc) => {tBloc.add(GetPokemonById(tPokemonId))},
      expect: () => [
        Loading(),
        Loaded(pokemon: tPokemon),
      ],
    );

    blocTest(
      'should emit Loading then Error state if bloc is failed',
      build: () {
        when(mockGetByPokemonId(params))
            .thenAnswer((_) async => Left(ServerFailure()));
        return tBloc;
      },
      act: (PokemonBloc tBloc) => {tBloc.add(GetPokemonById(tPokemonId))},
      expect: () => [
        Loading(),
        Error(message: serverFailureMessage),
      ],
    );
  });

  group('GetByPokemonName', () {
    const tPokemonName = "Bulbasaur";
    const tPokemon = Pokemon(
      name: 'Bulbasaur',
      height: 10,
      weight: 10,
      image: "www.google.com/images",
    );
    const params = PokemonNameParams(pokemonName: tPokemonName);

    blocTest(
      'should emit Loading then Loaded state if bloc is success',
      build: () {
        when(mockGetByPokemonName(params))
            .thenAnswer((_) async => const Right(tPokemon));
        return tBloc;
      },
      act: (PokemonBloc tBloc) => {tBloc.add(GetPokemonByName(tPokemonName))},
      expect: () => [
        Loading(),
        Loaded(pokemon: tPokemon),
      ],
    );

    blocTest(
      'should emit Loading then Error state if bloc is failed',
      build: () {
        when(mockGetByPokemonName(params))
            .thenAnswer((_) async => Left(ServerFailure()));
        return tBloc;
      },
      act: (PokemonBloc tBloc) => {tBloc.add(GetPokemonByName(tPokemonName))},
      expect: () => [
        Loading(),
        Error(message: serverFailureMessage),
      ],
    );
  });
}
