import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:pokedex/features/pokemon_list/domain/entities/pokemon_entity.dart';
import 'package:pokedex/features/pokemon_list/domain/usecases/get_pokemon_list.dart';
import 'package:pokedex/features/pokemon_list/presentation/cubits/base/base_cubit.dart';

part 'remote_pokemon_state.dart';

class RemotePokemonCubit extends BaseCubit<RemotePokemonState, List<PokemonEntity>> {
  RemotePokemonCubit(this._getPokemonList) : super(const RemotePokemonLoading(), []);

  final GetPokemonList _getPokemonList;

  Future<void> getPokemons() async {
    if (isBusy) return;

    await run(() async {
      _getPokemonList
          .execute()
          .then(
            (value) => emit(
              RemotePokemonLoaded(pokemons: value ?? []),
            ),
          )
          .catchError((e) => emit(RemotePokemonError(error: e)));
    });
  }
}
