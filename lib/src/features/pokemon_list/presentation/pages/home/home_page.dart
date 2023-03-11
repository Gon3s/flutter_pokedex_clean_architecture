import 'package:flutter/material.dart';
import 'package:pokedex/generated/l10n.dart';
import 'package:pokedex/src/core/constants/app_styles.dart';
import 'package:pokedex/src/core/constants/app_values.dart';
import 'package:pokedex/src/features/pokemon_list/presentation/pages/home/pokemon_list_widget.dart';
import 'package:pokedex/src/features/pokemon_list/presentation/widgets/vertical_spacing_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(
            AppValues.horizontalPadding,
            AppValues.horizontalPadding * 2,
            AppValues.horizontalPadding,
            0,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                S.of(context).home_title,
                style: AppStyles.headline1,
              ),
              const VerticalSpacing(),
              Text(
                S.of(context).home_subtitle,
                style: AppStyles.title,
              ),
              const VerticalSpacing(
                height: 16,
              ),
              const Expanded(child: PokemonListWidget()),
            ],
          ),
        ),
      ),
    );
  }
}
