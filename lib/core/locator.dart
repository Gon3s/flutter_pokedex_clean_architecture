import 'package:get_it/get_it.dart';
import 'package:pokedex/features/pokemon_list/data/remote/remote_api.dart';
import 'package:pokedex/features/pokemon_list/data/repositories/pokemon_list_repository.dart';
import 'package:pokedex/features/pokemon_list/domain/repositories/pokemon_list_repository.dart';
import 'package:pokedex/features/pokemon_list/domain/usecases/get_pokemon_list.dart';

final locator = GetIt.instance;

Future<void> initializeDependencies() async {
  locator.registerSingleton<RemoteApi>(
    RemoteApi(),
  );

  locator.registerSingleton<PokemonListRepository>(
    PokemonListRepositoryImpl(locator()),
  );

  locator.registerSingleton<GetPokemonList>(
    GetPokemonList(locator()),
  );
}
