import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:pokedex/src/features/pokemon_list/domain/entities/pokemon_details.dart';
import 'package:pokedex/src/features/pokemon_list/domain/entities/pokemon_entity.dart';
import 'package:pokedex/src/features/pokemon_list/presentation/cubits/base/base_cubit.dart';

import '../../../domain/usecases/get_pokemon_details.dart';

part 'pokemon_details_state.dart';

class PokemonDetailsCubit extends BaseCubit<PokemonDetailsState, List<PokemonEntity>> {
  PokemonDetailsCubit(this._getPokemonDetails, this.id) : super(const PokemonDetailsLoading(), []);

  final GetPokemonDetails _getPokemonDetails;
  final int id;

  Future<void> getPokemonDetails() async {
    if (isBusy) return;

    run(() {
      return _getPokemonDetails.execute(id: id).then(
        (pokemon) {
          emit(
            PokemonDetailsLoaded(
              pokemon: pokemon,
            ),
          );
        },
      );
    });
  }
}
