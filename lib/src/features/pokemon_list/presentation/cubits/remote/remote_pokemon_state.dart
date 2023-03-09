part of 'remote_pokemon_cubit.dart';

abstract class RemotePokemonState extends Equatable {
  final List<PokemonEntity> pokemons;
  final DioError? error;

  const RemotePokemonState({
    this.pokemons = const [],
    this.error,
  });

  @override
  List<Object?> get props => [pokemons];
}

class RemotePokemonLoading extends RemotePokemonState {
  const RemotePokemonLoading();
}

class RemotePokemonLoaded extends RemotePokemonState {
  const RemotePokemonLoaded({super.pokemons});
}

class RemotePokemonError extends RemotePokemonState {
  const RemotePokemonError({super.error});
}
