import 'package:pokedex/features/pokemon_list/domain/entities/pokemon_entity.dart';
import 'package:pokedex/features/pokemon_list/domain/repositories/pokemon_list_repository.dart';

class GetPokemonList {
  final PokemonListRepository repository;

  GetPokemonList(this.repository);

  Future<List<PokemonEntity>?> execute() async {
    return await repository.getPokemonList();
  }
}
