import 'package:equatable/equatable.dart';

class PokemonDetails extends Equatable {
  final int number;
  final String name;
  final String image;

  const PokemonDetails({
    required this.number,
    required this.name,
    required this.image,
  });

  @override
  List<Object?> get props => [number, name, image];
}
