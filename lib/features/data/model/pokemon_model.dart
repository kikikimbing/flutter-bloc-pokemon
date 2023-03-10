import '../../domain/entities/pokemon.dart';

class PokemonModel extends Pokemon {
  const PokemonModel({
    required super.name,
    required super.height,
    required super.weight,
    required super.image,
  });

  factory PokemonModel.fromJson(Map<String, dynamic> json) {
    return PokemonModel(
      name: json['name'],
      height: json['height'],
      weight: json['weight'],
      image: json['sprites']['front_default'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "name": name,
      "height": height,
      "weight": weight,
      "image": image,
    };
  }
}
