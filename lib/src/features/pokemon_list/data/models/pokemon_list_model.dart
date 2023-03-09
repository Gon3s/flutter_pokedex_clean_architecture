import 'package:equatable/equatable.dart';
import 'package:pokedex/src/core/data/api/request/serializable_protocol.dart';
import 'package:pokedex/src/features/pokemon_list/domain/entities/pokemon_entity.dart';

class PokemonListModel extends Serializable {
  final List<PokemonModel>? pokemonList;

  PokemonListModel({this.pokemonList});

  @override
  PokemonListModel? fromJson(dynamic json) {
    if (json == null || json['results'] is! List) return null;

    List<PokemonModel> tPokemonList = <PokemonModel>[];
    json['results'].forEach((pokemon) {
      tPokemonList.add(PokemonModel.fromJson(pokemon));
    });

    return PokemonListModel(pokemonList: tPokemonList);
  }

  @override
  get mockingData => {
        "count": 1279,
        "next": "https://pokeapi.co/api/v2/pokemon/?offset=20&limit=20",
        "previous": null,
        "results": [
          {"name": "bulbasaur", "url": "https://pokeapi.co/api/v2/pokemon/1/"},
          {"name": "ivysaur", "url": "https://pokeapi.co/api/v2/pokemon/2/"},
          {"name": "venusaur", "url": "https://pokeapi.co/api/v2/pokemon/3/"},
          {"name": "charmander", "url": "https://pokeapi.co/api/v2/pokemon/4/"},
          {"name": "charmeleon", "url": "https://pokeapi.co/api/v2/pokemon/5/"},
          {"name": "charizard", "url": "https://pokeapi.co/api/v2/pokemon/6/"},
          {"name": "squirtle", "url": "https://pokeapi.co/api/v2/pokemon/7/"},
          {"name": "wartortle", "url": "https://pokeapi.co/api/v2/pokemon/8/"},
          {"name": "blastoise", "url": "https://pokeapi.co/api/v2/pokemon/9/"},
          {"name": "caterpie", "url": "https://pokeapi.co/api/v2/pokemon/10/"},
          {"name": "metapod", "url": "https://pokeapi.co/api/v2/pokemon/11/"},
          {"name": "butterfree", "url": "https://pokeapi.co/api/v2/pokemon/12/"},
          {"name": "weedle", "url": "https://pokeapi.co/api/v2/pokemon/13/"},
          {"name": "kakuna", "url": "https://pokeapi.co/api/v2/pokemon/14/"},
          {"name": "beedrill", "url": "https://pokeapi.co/api/v2/pokemon/15/"},
          {"name": "pidgey", "url": "https://pokeapi.co/api/v2/pokemon/16/"},
          {"name": "pidgeotto", "url": "https://pokeapi.co/api/v2/pokemon/17/"},
          {"name": "pidgeot", "url": "https://pokeapi.co/api/v2/pokemon/18/"},
          {"name": "rattata", "url": "https://pokeapi.co/api/v2/pokemon/19/"},
          {"name": "raticate", "url": "https://pokeapi.co/api/v2/pokemon/20/"}
        ]
      };

  @override
  List<Object?> get props => [pokemonList];
}

class PokemonModel extends Equatable {
  final String name;
  final String url;

  const PokemonModel({required this.name, required this.url});

  factory PokemonModel.fromJson(Map<String, dynamic> json) => PokemonModel(
        name: json['name'] as String,
        url: json['url'] as String,
      );

  PokemonEntity toEntity() {
    var number = url.split('/').lastWhere((element) => element.isNotEmpty);
    return PokemonEntity(
      number: int.parse(number),
      name: name,
      image: 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/$number.png',
    );
  }

  @override
  List<Object?> get props => [name, url];
}
