import 'dart:io';

String fixture(String name) =>
    File('test/fixtures/pokemon.json').readAsStringSync();
