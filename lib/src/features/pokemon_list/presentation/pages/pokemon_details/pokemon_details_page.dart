import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:pokedex/src/core/constants/app_styles.dart';
import 'package:pokedex/src/core/extensions/strings_extensions.dart';
import 'package:pokedex/src/features/pokemon_list/domain/entities/pokemon_entity.dart';
import 'package:pokedex/src/features/pokemon_list/presentation/cubits/pokemon_details/pokemon_details_cubit.dart';

import '../../widgets/pokemon_image_widget.dart';

class PokemonDetailsPage extends StatelessWidget {
  const PokemonDetailsPage({
    super.key,
    required this.pokemonEntity,
  });

  final PokemonEntity pokemonEntity;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Column(
          children: [
            Text(
              pokemonEntity.name,
              style: AppStyles.headline1,
            ),
            Text(
              pokemonEntity.number.toString(),
              style: AppStyles.headline4,
            ),
          ],
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => GoRouter.of(context).pop(),
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            PokemonImage(image: pokemonEntity.image),
            BlocBuilder<PokemonDetailsCubit, PokemonDetailsState>(
              builder: (context, state) {
                switch (state.runtimeType) {
                  case PokemonDetailsLoading:
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  case PokemonDetailsLoaded:
                    return SafeArea(
                      child: Container(
                        padding: const EdgeInsets.all(16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              state.pokemon!.name,
                              style: Theme.of(context).textTheme.headline5!.copyWith(
                                    color: Colors.white,
                                  ),
                            ),
                            const SizedBox(height: 16),
                            Row(
                              children: [
                                Text(
                                  'Grass',
                                  style: Theme.of(context).textTheme.bodyText1!.copyWith(
                                        color: Colors.white,
                                      ),
                                ),
                                const SizedBox(width: 8),
                                Text(
                                  'Poison',
                                  style: Theme.of(context).textTheme.bodyText1!.copyWith(
                                        color: Colors.white,
                                      ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 16),
                            Text(
                              'Bulbasaur can be seen napping in bright sunlight. There is a seed on its back. By soaking up the sun\'s rays, the seed grows progressively larger.',
                              style: Theme.of(context).textTheme.bodyText1!.copyWith(
                                    color: Colors.white,
                                  ),
                            ),
                            const SizedBox(height: 16),
                            Text(
                              'Height: 0.7m',
                              style: Theme.of(context).textTheme.bodyText1!.copyWith(
                                    color: Colors.white,
                                  ),
                            ),
                            const SizedBox(height: 8),
                            Text(
                              'Weight: 6.9kg',
                              style: Theme.of(context).textTheme.bodyText1!.copyWith(
                                    color: Colors.white,
                                  ),
                            ),
                          ],
                        ),
                      ),
                    );

                  case PokemonDetailsError:
                    return const Center(
                      child: Text('Error'),
                    );
                  default:
                    return const Center(
                      child: Text('Error'),
                    );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
