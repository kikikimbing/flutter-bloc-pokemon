import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:http_mock_adapter/http_mock_adapter.dart';
import 'package:dio/dio.dart';
import 'package:pokemon_app/core/error/exceptions.dart';
import 'package:pokemon_app/features/data/datasource/pokemon_remote_data_source.dart';
import 'package:pokemon_app/features/data/model/pokemon_model.dart';

import '../../../../fixtures/fixture_reader.dart';

void main() async {
  late Dio dio;
  late DioAdapter dioAdapter;
  late PokemonRemoteDataSourceImpl dataSource;

  const tPokemonId = 1;
  const path = 'https://pokeapi.co/api/v2/pokemon/$tPokemonId';

  setUp(() {
    dio = Dio(BaseOptions(baseUrl: path));
    dioAdapter = DioAdapter(dio: dio);
    dataSource = PokemonRemoteDataSourceImpl(httpClient: dio);
  });
  group('getByPokemonId', () {
    final tPokemonModel =
        PokemonModel.fromJson(json.decode(fixture('trivia.json')));
    final pokemonData = json.decode(fixture('pokemon.json'));

    test(
      'should perform GET request and return PokemonModel when response code 200',
      () async {
        // arrange
        dioAdapter.onGet(path, (server) => server.reply(200, pokemonData));
        // act
        final result = await dataSource.getByPokemonId(tPokemonId);
        // assert
        expect(result, tPokemonModel);
      },
    );

    test(
        'should throw a ServerException when the response code is 404 or other',
        () {
      // arrange
      dioAdapter.onGet(
        path,
        (server) => server.throws(
          404,
          DioError(requestOptions: RequestOptions(path: path)),
        ),
      );
      // act
      final result = dataSource.getByPokemonId;
      // assert
      expect(() async => await result(tPokemonId),
          throwsA(isA<ServerException>()));
    });
  });
}
