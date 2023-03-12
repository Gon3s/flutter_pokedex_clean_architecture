import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../../core/constants/app_colors.dart';
import 'center_circular_progress_widget.dart';

class PokemonImage extends StatelessWidget {
  const PokemonImage({
    super.key,
    required this.image,
  });

  final String image;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return CachedNetworkImage(
      imageUrl: image,
      width: width * 0.35,
      height: width * 0.35,
      placeholder: (context, url) => const CenterCircularProgress(),
      errorWidget: (context, url, error) => const Center(
        child: Icon(
          Icons.error,
          color: AppColors.errorColor,
        ),
      ),
    );
  }
}
