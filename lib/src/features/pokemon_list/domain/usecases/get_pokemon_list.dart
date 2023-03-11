import 'package:pokedex/src/features/pokemon_list/domain/entities/pokemon_entity.dart';
import 'package:pokedex/src/features/pokemon_list/domain/repositories/pokemon_list_repository.dart';

class GetPokemonList {
  final PokemonListRepository repository;

  GetPokemonList(this.repository);

  Future<List<PokemonEntity>?> execute({required int page}) async {
    return await repository.getPokemonList(page: page);
  }
}
