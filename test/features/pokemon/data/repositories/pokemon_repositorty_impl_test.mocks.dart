// Mocks generated by Mockito 5.3.2 from annotations
// in pokemon_app/test/features/pokemon/data/repositories/pokemon_repositorty_impl_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i5;

import 'package:dio/dio.dart' as _i2;
import 'package:mockito/mockito.dart' as _i1;
import 'package:pokemon_app/features/data/datasource/pokemon_remote_data_source.dart'
    as _i4;
import 'package:pokemon_app/features/data/model/pokemon_model.dart' as _i3;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types
// ignore_for_file: subtype_of_sealed_class

class _FakeDio_0 extends _i1.SmartFake implements _i2.Dio {
  _FakeDio_0(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakePokemonModel_1 extends _i1.SmartFake implements _i3.PokemonModel {
  _FakePokemonModel_1(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

/// A class which mocks [PokemonRemoteDataSourceImpl].
///
/// See the documentation for Mockito's code generation for more information.
class MockPokemonRemoteDataSourceImpl extends _i1.Mock
    implements _i4.PokemonRemoteDataSourceImpl {
  MockPokemonRemoteDataSourceImpl() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i2.Dio get httpClient => (super.noSuchMethod(
        Invocation.getter(#httpClient),
        returnValue: _FakeDio_0(
          this,
          Invocation.getter(#httpClient),
        ),
      ) as _i2.Dio);
  @override
  _i5.Future<_i3.PokemonModel> getByPokemonId(int? number) =>
      (super.noSuchMethod(
        Invocation.method(
          #getByPokemonId,
          [number],
        ),
        returnValue: _i5.Future<_i3.PokemonModel>.value(_FakePokemonModel_1(
          this,
          Invocation.method(
            #getByPokemonId,
            [number],
          ),
        )),
      ) as _i5.Future<_i3.PokemonModel>);
  @override
  _i5.Future<_i3.PokemonModel> getByPokemonName(String? pokemonName) =>
      (super.noSuchMethod(
        Invocation.method(
          #getByPokemonName,
          [pokemonName],
        ),
        returnValue: _i5.Future<_i3.PokemonModel>.value(_FakePokemonModel_1(
          this,
          Invocation.method(
            #getByPokemonName,
            [pokemonName],
          ),
        )),
      ) as _i5.Future<_i3.PokemonModel>);
}
