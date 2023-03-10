import 'package:dio/dio.dart';
import 'package:pokemon_app/features/data/model/pokemon_model.dart';

import '../../../core/error/exceptions.dart';

abstract class PokemonRemoteDataSource {
  /// Calls https://pokeapi.co/api/v2/pokemon/{id} endpoint
  ///
  /// Throws a [ServerException] for all error code
  Future<PokemonModel> getByPokemonId(int number);

  /// Calls https://pokeapi.co/api/v2/pokemon/{name} endpoint
  ///
  /// Throws a [ServerException] for all error code
  Future<PokemonModel> getByPokemonName(String pokemonName);
}

class PokemonRemoteDataSourceImpl extends PokemonRemoteDataSource {
  final Dio httpClient;

  PokemonRemoteDataSourceImpl({required this.httpClient}) : super();

  @override
  Future<PokemonModel> getByPokemonId(int number) {
    return _getPokemonFromApi('https://pokeapi.co/api/v2/pokemon/$number');
  }

  @override
  Future<PokemonModel> getByPokemonName(String pokemonName) =>
      _getPokemonFromApi('https://pokeapi.co/api/v2/pokemon/$pokemonName');

  Future<PokemonModel> _getPokemonFromApi(String url) async {
    try {
      final response = await httpClient.get(url);
      return PokemonModel.fromJson(response.data);
    } on DioError {
      throw ServerException();
    }
  }
}
