import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import '../../../../../core/constants/app_values.dart';
import '../../../../../core/extensions/scroll_controller_extensions.dart';
import '../../cubits/pokemon_list/pokemon_list_cubit.dart';
import '../../widgets/center_circular_progress_widget.dart';
import 'pokemon_tile_widget.dart';

class PokemonListWidget extends HookWidget {
  const PokemonListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final remotePokemonCubit = BlocProvider.of<PokemonListCubit>(context);
    ScrollController scrollController = useScrollController();

    useEffect(
      () {
        scrollController.onScrollEndsListener(() {
          remotePokemonCubit.getPokemons();
        });

        return () {
          scrollController;
        };
      },
      [scrollController],
    );

    return BlocBuilder<PokemonListCubit, PokemonListState>(
      builder: (_, state) {
        switch (state.runtimeType) {
          case PokemonListLoading:
            return const CenterCircularProgress();
          case PokemonListLoaded:
            return CustomScrollView(
              shrinkWrap: true,
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
          case PokemonListError:
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
