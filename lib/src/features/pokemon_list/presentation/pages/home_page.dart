import 'package:flutter/material.dart';
import 'package:pokedex/generated/l10n.dart';
import 'package:pokedex/src/features/pokemon_list/presentation/pages/pokemon_list_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    // final remotePokemonCubit = BlocProvider.of<RemotePokemonCubit>(context);

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(
            16.0,
            32.0,
            16.0,
            16.0,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                S.of(context).home_title,
                style: const TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 8.0,
              ),
              Text(
                S.of(context).home_subtitle,
                style: const TextStyle(
                  fontSize: 16,
                ),
              ),
              const SizedBox(
                height: 8.0,
              ),
              const Expanded(child: PokemonListWidget()),
            ],
          ),
        ),
      ),
    );
  }
}
