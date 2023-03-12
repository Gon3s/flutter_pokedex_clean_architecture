import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import '../../../../../core/constants/app_values.dart';
import '../../../../../core/extensions/scroll_controller_extensions.dart';
import '../../cubits/remote/remote_pokemon_cubit.dart';
import '../../widgets/center_circular_progress_widget.dart';
import 'pokemon_tile_widget.dart';

class PokemonListWidget extends HookWidget {
  const PokemonListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final remotePokemonCubit = BlocProvider.of<RemotePokemonCubit>(context);
    ScrollController scrollController = useScrollController();

    useEffect(() {
      scrollController.onScrollEndsListener(() {
        remotePokemonCubit.getPokemons();
      });

      return scrollController.dispose;
      },
    );

    return BlocBuilder<RemotePokemonCubit, RemotePokemonState>(
      builder: (_, state) {
        switch (state.runtimeType) {
          case RemotePokemonLoading:
            return const CenterCircularProgress();
          case RemotePokemonLoaded:
            return CustomScrollView(
              controller: scrollController,
              physics: const BouncingScrollPhysics(),
              slivers: [
                SliverGrid(
                  delegate: SliverChildBuilderDelegate(
                    (_, index) => PokemonTile(
                      pokemon: state.pokemons[index],
                    ),
                    childCount: state.pokemons.length,
                  ),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 4 / 5,
                    crossAxisSpacing: AppValues.horizontalPadding / 2,
                    mainAxisSpacing: AppValues.horizontalPadding / 2,
                  ),
                ),
                if (!state.noMoreData)
                  const SliverToBoxAdapter(
                    child: Padding(
                      padding: EdgeInsets.symmetric(vertical: AppValues.horizontalPadding),
                      child: CenterCircularProgress(),
                    ),
                  ),
              ],
            );
          // return GridView.builder(
          //   shrinkWrap: true,
          //   controller: scrollController,
          //   physics: const BouncingScrollPhysics(),
          //   itemCount: state.pokemons.length + (state.noMoreData ? 0 : 1),
          //   itemBuilder: (_, index) {
          //     if (index == state.pokemons.length) {
          //       return const CenterCircularProgress();
          //     }
          //     return PokemonTile(
          //       pokemon: state.pokemons[index],
          //     );
          //   },
          //   gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          //     crossAxisCount: 2,
          //     childAspectRatio: 4 / 5,
          //     crossAxisSpacing: AppValues.horizontalPadding / 2,
          //     mainAxisSpacing: AppValues.horizontalPadding / 2,
          //   ),
          // );
          case RemotePokemonError:
            return Center(
              child: Text(state.error.toString()),
            );
          default:
            return const SizedBox();
        }
      },
    );
  }
}
