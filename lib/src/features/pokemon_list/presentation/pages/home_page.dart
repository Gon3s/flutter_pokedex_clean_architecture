import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokedex/src/features/pokemon_list/presentation/cubits/remote/remote_pokemon_cubit.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    // final remotePokemonCubit = BlocProvider.of<RemotePokemonCubit>(context);

    return Scaffold(
        appBar: AppBar(
          title: const Text('Pokedex'),
        ),
        body: BlocBuilder<RemotePokemonCubit, RemotePokemonState>(
          builder: (context, state) {
            if (state is RemotePokemonLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }

            if (state is RemotePokemonLoaded) {
              print(state.pokemons.length);
              return ListView.builder(
                itemCount: state.pokemons.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(state.pokemons[index].name),
                  );
                },
              );
            }

            if (state is RemotePokemonError) {
              return Center(
                child: Text(state.error.toString()),
              );
            }

            return const SizedBox();
          },
        ));
  }
}
