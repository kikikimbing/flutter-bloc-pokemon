import 'package:equatable/equatable.dart';

class Pokemon extends Equatable {
  final String name;
  final int weight;
  final int height;
  final String image;

  const Pokemon({
    required this.name,
    required this.weight,
    required this.height,
    required this.image,
  });

  @override
  List<Object> get props => [name, weight, height, image];
}
