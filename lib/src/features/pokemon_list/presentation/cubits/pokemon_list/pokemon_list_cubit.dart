import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:pokedex/src/features/pokemon_list/domain/entities/pokemon_entity.dart';
import 'package:pokedex/src/features/pokemon_list/domain/usecases/get_pokemon_list.dart';
import 'package:pokedex/src/features/pokemon_list/presentation/cubits/base/base_cubit.dart';

part 'pokemon_list_state.dart';

class PokemonListCubit extends BaseCubit<PokemonListState, List<PokemonEntity>> {
  PokemonListCubit(this._getPokemonList) : super(const PokemonListLoading(), []);

  final GetPokemonList _getPokemonList;

  int _page = 1;

  Future<void> getPokemons() async {
    if (isBusy) return;

    run(() {
      return _getPokemonList.execute(page: _page).then(
        (value) {
          final noMoreData = value == null || value.isEmpty;
          if (value != null) {
            data.addAll(value);
          }

          _page++;

          emit(
            PokemonListLoaded(
              pokemons: data.clone(),
              noMoreData: noMoreData,
            ),
          );
        },
      );
    });
  }
}
