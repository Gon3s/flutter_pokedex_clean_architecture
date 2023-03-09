import 'package:flutter_test/flutter_test.dart';
import 'package:pokedex/src/features/pokemon_list/data/models/pokemon_list_model.dart';
import 'package:pokedex/src/features/pokemon_list/domain/entities/pokemon_entity.dart';

void main() {
  const tPokemonModel = PokemonModel(
    name: 'bulbasaur',
    url: 'https://pokeapi.co/api/v2/pokemon/1/',
  );
  final tPokemonListModel = PokemonListModel(
    pokemonList: const [
      tPokemonModel,
    ],
  );
  const tPokemonEntity = PokemonEntity(
    image: 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/1.png',
    name: 'bulbasaur',
    number: 1,
  );

  test('should return a PokemonEntity', () {
    // arrange
    final pokemonEntity = tPokemonModel.toEntity();

    // assert
    expect(pokemonEntity, isA<PokemonEntity>());
    expect(pokemonEntity, tPokemonEntity);
  });

  group('fromJson', () {
    test('should return a valid PokemonModel', () {
      // arrange
      final Map<String, dynamic> jsonMap = {
        'name': 'bulbasaur',
        'url': 'https://pokeapi.co/api/v2/pokemon/1/',
      };

      // act
      final result = PokemonModel.fromJson(jsonMap);

      // assert
      expect(result, tPokemonModel);
    });

    test('should return a valid PokemonListModel', () {
      // arrange
      final Map<String, dynamic> jsonMap = {
        'results': [
          {
            'name': 'bulbasaur',
            'url': 'https://pokeapi.co/api/v2/pokemon/1/',
          },
        ],
      };

      // act
      final result = PokemonListModel().fromJson(jsonMap);

      // assert
      expect(result, tPokemonListModel);
    });

    test('should return a null if the json is null', () {
      // arrange
      const Map<String, dynamic>? jsonMap = null;

      // act
      final result = PokemonListModel().fromJson(jsonMap);

      // assert
      expect(result, null);
    });

    test('should return a null if the results into json return empty PokemonList', () {
      // arrange
      const Map<String, dynamic> jsonMap = {
        'results': [],
      };

      // act
      final result = PokemonListModel().fromJson(jsonMap);

      // assert
      expect(result, PokemonListModel(pokemonList: const []));
    });
  });
}
