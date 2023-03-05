import 'package:pokedex/features/pokemon_list/data/models/pokemon_list_model.dart';
import 'package:pokedex/features/pokemon_list/data/remote/remote_api.dart';
import 'package:pokedex/features/pokemon_list/domain/entities/pokemon_entity.dart';
import 'package:pokedex/features/pokemon_list/domain/repositories/pokemon_list_repository.dart';

class PokemonListRepositoryImpl implements PokemonListRepository {
  final RemoteApi remoteApi;

  PokemonListRepositoryImpl(this.remoteApi);

  @override
  Future<List<PokemonEntity>?> getPokemonList() async {
    return remoteApi.getPokemonList().then(
          (result) => result.fold(
            (_) => null,
            (PokemonListModel data) {
              if (data.pokemonList == null) return null;
              return data.pokemonList!.map((e) => e.toEntity()).toList();
            },
          ),
        );
  }
}
