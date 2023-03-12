part of 'pokemon_details_cubit.dart';

abstract class PokemonDetailsState extends Equatable {
  final PokemonDetails? pokemon;
  final DioError? error;

  const PokemonDetailsState({
    this.pokemon,
    this.error,
  });

  @override
  List<Object?> get props => [pokemon, error];
}

class PokemonDetailsLoading extends PokemonDetailsState {
  const PokemonDetailsLoading();
}

class PokemonDetailsLoaded extends PokemonDetailsState {
  const PokemonDetailsLoaded({super.pokemon});
}

class PokemonDetailsError extends PokemonDetailsState {
  const PokemonDetailsError({super.error});
}
