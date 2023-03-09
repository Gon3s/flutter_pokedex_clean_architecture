import 'dart:async';
import 'package:flutter/material.dart';
import 'package:palette_generator/palette_generator.dart';

Future<Color> getDominantColorFromImageUrl(String imageUrl) async {
  final completer = Completer<Color>();
  final image = NetworkImage(imageUrl);
  image.resolve(const ImageConfiguration()).addListener(
    ImageStreamListener(
      (ImageInfo info, bool _) async {
        final paletteGenerator = await PaletteGenerator.fromImageProvider(
          image,
        );
        completer.complete(paletteGenerator.dominantColor?.color);
      },
    ),
  );
  return completer.future;
}
