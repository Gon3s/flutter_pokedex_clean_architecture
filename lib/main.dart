import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokedex/core/locator.dart';
import 'package:pokedex/features/pokemon_list/domain/usecases/get_pokemon_list.dart';
import 'package:pokedex/features/pokemon_list/presentation/cubits/remote/remote_pokemon_cubit.dart';
import 'package:pokedex/features/pokemon_list/presentation/pages/home_page.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await initializeDependencies();

  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => RemotePokemonCubit(locator<GetPokemonList>())..getPokemons(),
        )
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: HomePage(),
      ),
    );
  }
}
