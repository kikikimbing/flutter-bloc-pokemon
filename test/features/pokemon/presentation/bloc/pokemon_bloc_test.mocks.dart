// Mocks generated by Mockito 5.3.2 from annotations
// in pokemon_app/test/features/pokemon/presentation/bloc/pokemon_bloc_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i5;

import 'package:fpdart/fpdart.dart' as _i3;
import 'package:mockito/mockito.dart' as _i1;
import 'package:pokemon_app/core/error/failures.dart' as _i6;
import 'package:pokemon_app/features/domain/entities/pokemon.dart' as _i7;
import 'package:pokemon_app/features/domain/repositories/pokemon_repository.dart'
    as _i2;
import 'package:pokemon_app/features/domain/usecases/get_by_pokemon_id.dart'
    as _i4;
import 'package:pokemon_app/features/domain/usecases/get_by_pokemon_name.dart'
    as _i8;

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

class _FakePokemonRepository_0 extends _i1.SmartFake
    implements _i2.PokemonRepository {
  _FakePokemonRepository_0(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeEither_1<L, R> extends _i1.SmartFake implements _i3.Either<L, R> {
  _FakeEither_1(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

/// A class which mocks [GetByPokemonId].
///
/// See the documentation for Mockito's code generation for more information.
class MockGetByPokemonId extends _i1.Mock implements _i4.GetByPokemonId {
  MockGetByPokemonId() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i2.PokemonRepository get repository => (super.noSuchMethod(
        Invocation.getter(#repository),
        returnValue: _FakePokemonRepository_0(
          this,
          Invocation.getter(#repository),
        ),
      ) as _i2.PokemonRepository);
  @override
  _i5.Future<_i3.Either<_i6.Failure, _i7.Pokemon>> call(
          _i4.PokemonIdParams? params) =>
      (super.noSuchMethod(
        Invocation.method(
          #call,
          [params],
        ),
        returnValue: _i5.Future<_i3.Either<_i6.Failure, _i7.Pokemon>>.value(
            _FakeEither_1<_i6.Failure, _i7.Pokemon>(
          this,
          Invocation.method(
            #call,
            [params],
          ),
        )),
      ) as _i5.Future<_i3.Either<_i6.Failure, _i7.Pokemon>>);
}

/// A class which mocks [GetByPokemonName].
///
/// See the documentation for Mockito's code generation for more information.
class MockGetByPokemonName extends _i1.Mock implements _i8.GetByPokemonName {
  MockGetByPokemonName() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i2.PokemonRepository get repository => (super.noSuchMethod(
        Invocation.getter(#repository),
        returnValue: _FakePokemonRepository_0(
          this,
          Invocation.getter(#repository),
        ),
      ) as _i2.PokemonRepository);
  @override
  _i5.Future<_i3.Either<_i6.Failure, _i7.Pokemon>> call(
          _i8.PokemonNameParams? params) =>
      (super.noSuchMethod(
        Invocation.method(
          #call,
          [params],
        ),
        returnValue: _i5.Future<_i3.Either<_i6.Failure, _i7.Pokemon>>.value(
            _FakeEither_1<_i6.Failure, _i7.Pokemon>(
          this,
          Invocation.method(
            #call,
            [params],
          ),
        )),
      ) as _i5.Future<_i3.Either<_i6.Failure, _i7.Pokemon>>);
}
