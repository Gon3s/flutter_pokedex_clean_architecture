import 'package:pokedex/features/pokemon_list/domain/entities/pokemon_entity.dart';

abstract class PokemonListRepository {
  Future<List<PokemonEntity>?> getPokemonList();
}
