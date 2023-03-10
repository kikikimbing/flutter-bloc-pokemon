import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:pokemon_app/features/data/model/pokemon_model.dart';
import 'package:pokemon_app/features/domain/entities/pokemon.dart';

import '../../../../fixtures/fixture_reader.dart';

void main() {
  const dummyPokemonModel = PokemonModel(
    name: 'Bulbasaur',
    height: 10,
    weight: 10,
    image: "www.google.com/images",
  );
  test('Should be a subclass of Pokemon entity', () async {
    expect(dummyPokemonModel, isA<Pokemon>());
  });

  group('fromJson', () {
    test(
      'should should return valid model',
      () async {
        // arrange
        final Map<String, dynamic> jsonMap =
            json.decode(fixture('pokemon.json'));
        // act
        final result = PokemonModel.fromJson(jsonMap);
        // assert
        expect(result, dummyPokemonModel);
      },
    );
  });

  group('toJson', () {
    test(
      'should return a JSON map containing the proper data',
      () async {
        // act
        final result = dummyPokemonModel.toJson();
        // assert
        final expectedMap = {
          "name": 'Bulbasaur',
          "height": 10,
          "weight": 10,
          "image": "www.google.com/images",
        };
        expect(result, expectedMap);
      },
    );
  });
}
