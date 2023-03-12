part of 'pokemon_list_cubit.dart';

abstract class PokemonListState extends Equatable {
  final List<PokemonEntity> pokemons;
  final bool noMoreData;
  final DioError? error;

  const PokemonListState({
    this.pokemons = const [],
    this.noMoreData = true,
    this.error,
  });

  @override
  List<Object?> get props => [pokemons, noMoreData, error];
}

class PokemonListLoading extends PokemonListState {
  const PokemonListLoading();
}

class PokemonListLoaded extends PokemonListState {
  const PokemonListLoaded({
    super.pokemons,
    super.noMoreData,
  });
}

class PokemonListError extends PokemonListState {
  const PokemonListError({super.error});
}
