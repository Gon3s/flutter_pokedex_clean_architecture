import 'package:equatable/equatable.dart';

class PokemonEntity extends Equatable {
  final int number;
  final String name;
  final String image;

  const PokemonEntity({
    required this.number,
    required this.name,
    required this.image,
  });

  @override
  List<Object?> get props => [number, name, image];
}
