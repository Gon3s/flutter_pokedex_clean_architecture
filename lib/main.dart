import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokedex/generated/l10n.dart';
import 'package:pokedex/src/core/locator.dart';
import 'package:pokedex/src/features/pokemon_list/domain/usecases/get_pokemon_list.dart';
import 'package:pokedex/src/features/pokemon_list/presentation/cubits/remote/remote_pokemon_cubit.dart';
import 'package:pokedex/src/features/pokemon_list/presentation/pages/home_page.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

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
      child: MaterialApp(
        localizationsDelegates: const [
          S.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: S.delegate.supportedLocales,
        debugShowCheckedModeBanner: false,
        home: HomePage(),
      ),
    );
  }
}
