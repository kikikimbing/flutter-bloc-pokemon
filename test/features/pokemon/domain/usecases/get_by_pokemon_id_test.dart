import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:mockito/mockito.dart';
import 'package:pokemon_app/features/domain/entities/pokemon.dart';
import 'package:pokemon_app/features/domain/repositories/pokemon_repository.dart';
import 'package:pokemon_app/features/domain/usecases/get_by_pokemon_id.dart';

import 'package:mockito/annotations.dart';
import './get_by_pokemon_id_test.mocks.dart';

@GenerateMocks([PokemonRepository])
void main() {
  late GetByPokemonId usecase;
  late MockPokemonRepository mockPokemonRepository;

  setUp(() {
    mockPokemonRepository = MockPokemonRepository();
    usecase = GetByPokemonId(repository: mockPokemonRepository);
  });

  const tPokemonId = 1;
  const tPokemon = Pokemon(
    name: 'Bulbasaur',
    height: 10,
    weight: 10,
    image: "www.google.com/images",
  );

  test(
    'should get pokemon from the id from the repository',
    () async {
      // arrange
      when(mockPokemonRepository.getByPokemonId(tPokemonId))
          .thenAnswer((_) async => const Right(tPokemon));
      // act
      final result = await usecase(const PokemonIdParams(id: tPokemonId));
      // assert
      expect(result, const Right(tPokemon));
      verify(mockPokemonRepository.getByPokemonId(tPokemonId));
      verifyNoMoreInteractions(mockPokemonRepository);
    },
  );
}
