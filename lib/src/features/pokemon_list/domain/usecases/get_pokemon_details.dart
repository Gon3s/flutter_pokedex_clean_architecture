import '../entities/pokemon_details.dart';
import '../repositories/pokemon_list_repository.dart';

class GetPokemonDetails {
  final PokemonListRepository repository;

  GetPokemonDetails(this.repository);

  Future<PokemonDetails> execute({required int id}) async {
    return await repository.getPokemonDetails(id: id);
  }
}
