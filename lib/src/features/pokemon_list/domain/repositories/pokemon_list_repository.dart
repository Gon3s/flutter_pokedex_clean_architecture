import 'package:pokedex/src/features/pokemon_list/domain/entities/pokemon_entity.dart';

import '../entities/pokemon_details.dart';

abstract class PokemonListRepository {
  Future<List<PokemonEntity>?> getPokemonList({required int page});

  Future<PokemonDetails> getPokemonDetails({required int id});
}
