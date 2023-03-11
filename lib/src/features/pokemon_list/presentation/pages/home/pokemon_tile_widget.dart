import 'package:flutter/material.dart';
import 'package:pokedex/src/core/extensions/strings_extensions.dart';

import '../../../../../core/constants/app_styles.dart';
import '../../../../../core/constants/app_values.dart';
import '../../../../../core/utilities/get_dominiant_color.dart';
import '../../../domain/entities/pokemon_entity.dart';
import '../../widgets/pokemon_image_widget.dart';
import '../../widgets/vertical_spacing_widget.dart';

class PokemonTile extends StatefulWidget {
  final PokemonEntity pokemon;

  const PokemonTile({
    super.key,
    required this.pokemon,
  });

  @override
  State<PokemonTile> createState() => _PokemonTileState();
}

class _PokemonTileState extends State<PokemonTile> {
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
          Radius.circular(AppValues.defaultBorderRadius),
        ),
      ),
      padding: const EdgeInsets.all(AppValues.defaultPadding),
      child: Column(
        children: [
          PokemonImage(image: widget.pokemon.image),
          const VerticalSpacing(),
          Text(
            widget.pokemon.name.ucfirst(),
            style: AppStyles.headline3.copyWith(
              color: Colors.white,
            ),
          ),
          Text(
            widget.pokemon.number.format(),
            style: AppStyles.title.copyWith(
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
