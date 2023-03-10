import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:mockito/mockito.dart';
import 'package:pokemon_app/core/error/exceptions.dart';
import 'package:pokemon_app/core/error/failures.dart';
import 'package:pokemon_app/features/data/datasource/pokemon_remote_data_source.dart';
import 'package:pokemon_app/features/data/model/pokemon_model.dart';
import 'package:pokemon_app/features/data/repositories/pokemon_repository_impl.dart';

import 'package:mockito/annotations.dart';
import './pokemon_repositorty_impl_test.mocks.dart';

@GenerateMocks([PokemonRemoteDataSourceImpl])
void main() {
  late PokemonRepositoryImpl repository;
  late PokemonRemoteDataSourceImpl mockRemoteDataSource;

  setUp(() {
    mockRemoteDataSource = MockPokemonRemoteDataSourceImpl();
    repository = PokemonRepositoryImpl(remoteDataSource: mockRemoteDataSource);
  });

  group('getByPokemonId', () {
    const tPokemonId = 1;
    const tPokemonModel = PokemonModel(
        name: 'Bulbasaur',
        height: 10,
        weight: 10,
        image: 'www.google.com/images');

    test(
      'should return remote data when the call to remote data source is successful',
      () async {
        // arrange
        when(mockRemoteDataSource.getByPokemonId(tPokemonId))
            .thenAnswer((_) async => tPokemonModel);
        // act
        final result = await repository.getByPokemonId(tPokemonId);
        // assert
        verify(mockRemoteDataSource.getByPokemonId(tPokemonId));
        expect(result, equals(const Right(tPokemonModel)));
      },
    );

    test(
      'should return Server Failure when the call to remote data source is unsuccessful',
      () async {
        // arrange
        when(mockRemoteDataSource.getByPokemonId(tPokemonId))
            .thenThrow(ServerException());
        // act
        final result = await repository.getByPokemonId(tPokemonId);
        // assert
        expect(result, equals(Left(ServerFailure())));
      },
    );
  });
}
