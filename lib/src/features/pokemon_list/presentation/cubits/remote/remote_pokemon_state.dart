part of 'remote_pokemon_cubit.dart';

abstract class RemotePokemonState extends Equatable {
  final List<PokemonEntity> pokemons;
  final bool noMoreData;
  final DioError? error;

  const RemotePokemonState({
    this.pokemons = const [],
    this.noMoreData = true,
    this.error,
  });

  @override
  List<Object?> get props => [pokemons, noMoreData, error];
}

class RemotePokemonLoading extends RemotePokemonState {
  const RemotePokemonLoading();
}

class RemotePokemonLoaded extends RemotePokemonState {
  const RemotePokemonLoaded({
    super.pokemons,
    super.noMoreData,
  });
}

class RemotePokemonError extends RemotePokemonState {
  const RemotePokemonError({super.error});
}
