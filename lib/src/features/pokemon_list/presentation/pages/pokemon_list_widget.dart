import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokedex/src/core/utilities/get_dominiant_color.dart';
import 'package:pokedex/src/features/pokemon_list/domain/entities/pokemon_entity.dart';
import 'package:pokedex/src/features/pokemon_list/presentation/cubits/remote/remote_pokemon_cubit.dart';

class PokemonListWidget extends StatefulWidget {
  const PokemonListWidget({super.key});

  @override
  State<PokemonListWidget> createState() => _PokemonListWidgetState();
}

class _PokemonListWidgetState extends State<PokemonListWidget> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RemotePokemonCubit, RemotePokemonState>(
      builder: (context, state) {
        if (state is RemotePokemonLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }

        if (state is RemotePokemonLoaded) {
          return GridView.builder(
            itemCount: state.pokemons.length,
            itemBuilder: (context, index) {
              return _PokemonTile(
                pokemon: state.pokemons[index],
              );
            },
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 4 / 5,
              crossAxisSpacing: 8.0,
              mainAxisSpacing: 8.0,
            ),
          );
        }

        if (state is RemotePokemonError) {
          return Center(
            child: Text(state.error.toString()),
          );
        }

        return const SizedBox();
      },
    );
  }
}

class _PokemonTile extends StatefulWidget {
  final PokemonEntity pokemon;

  const _PokemonTile({
    required this.pokemon,
  });

  @override
  State<_PokemonTile> createState() => _PokemonTileState();
}

class _PokemonTileState extends State<_PokemonTile> {
  Color? _dominantColor;

  @override
  void initState() {
    super.initState();

    getDominantColorFromImageUrl(widget.pokemon.image).then((color) {
      setState(() {
        _dominantColor = color;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: _dominantColor ?? Colors.white,
        borderRadius: const BorderRadius.all(
          Radius.circular(16.0),
        ),
      ),
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Image.network(
            widget.pokemon.image,
            fit: BoxFit.fitHeight,
            errorBuilder: (context, error, stackTrace) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            },
          ),
          Text(widget.pokemon.name),
          Text(widget.pokemon.number.format()),
        ],
      ),
    );
  }
}

extension FormatIntToString on int {
  String format() {
    return toString().padLeft(3, '0');
  }
}
