import 'package:pokedex/src/core/data/api/request/serializable_protocol.dart';
import 'package:pokedex/src/features/pokemon_list/domain/entities/pokemon_details.dart';

class PokemonDetailsModel extends Serializable {
  final int? id;
  final String? name;

  PokemonDetailsModel({
    this.name,
    this.id,
  });

  @override
  PokemonDetailsModel fromJson(dynamic json) {
    return PokemonDetailsModel(
      id: json['id'] as int,
      name: json['name'] as String,
    );
  }

  @override
  List<Object?> get props => [name, id];

  toEntity() => PokemonDetails(
        number: id!,
        name: name!,
        image: 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/$id.png',
      );
}
