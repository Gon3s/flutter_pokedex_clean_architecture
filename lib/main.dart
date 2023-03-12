import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:pokedex/src/features/pokemon_list/domain/usecases/get_pokemon_details.dart';

import 'generated/l10n.dart';
import 'src/core/locator.dart';
import 'src/core/router.dart';
import 'src/features/pokemon_list/domain/usecases/get_pokemon_list.dart';
import 'src/features/pokemon_list/presentation/cubits/pokemon_details/pokemon_details_cubit.dart';
import 'src/features/pokemon_list/presentation/cubits/pokemon_list/pokemon_list_cubit.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  initializeDependencies();

  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      localizationsDelegates: const [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: S.delegate.supportedLocales,
      debugShowCheckedModeBanner: false,
      routerConfig: router,
    );
  }
}
