import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:pokedex/src/features/pokemon_list/domain/entities/pokemon_entity.dart';
import 'package:pokedex/src/features/pokemon_list/presentation/pages/home/home_page.dart';

import '../features/pokemon_list/domain/usecases/get_pokemon_details.dart';
import '../features/pokemon_list/domain/usecases/get_pokemon_list.dart';
import '../features/pokemon_list/presentation/cubits/pokemon_details/pokemon_details_cubit.dart';
import '../features/pokemon_list/presentation/cubits/pokemon_list/pokemon_list_cubit.dart';
import '../features/pokemon_list/presentation/pages/pokemon_details/pokemon_details_page.dart';
import 'locator.dart';

// GoRouter configuration
final router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (_, __) => BlocProvider(
        create: (context) => PokemonListCubit(
          locator<GetPokemonList>(),
        )..getPokemons(),
        child: HomePage(),
      ),
    ),
    GoRoute(
      path: '/pokemon',
      name: 'pokemonDetails',
      builder: (_, state) {
        PokemonEntity pokemon = state.extra as PokemonEntity;

        return BlocProvider(
          create: (BuildContext context) {
            return PokemonDetailsCubit(
              locator<GetPokemonDetails>(),
              pokemon.number,
            )..getPokemonDetails();
          },
          child: PokemonDetailsPage(
            pokemonEntity: pokemon,
          ),
        );
      },
    ),
  ],
);
