import 'dart:async';
import 'package:flutter/material.dart';
import 'package:palette_generator/palette_generator.dart';

Future<Color> getDominantColorFromImageUrl(String imageUrl) {
  final completer = Completer<Color>();
  final image = NetworkImage(imageUrl);
  image.resolve(const ImageConfiguration()).addListener(
    ImageStreamListener(
      (ImageInfo info, _) {
        PaletteGenerator.fromImageProvider(
          image,
          maximumColorCount: 10,
        ).then(
          (value) => completer.complete(value.dominantColor?.color),
        );
      },
    ),
  );

  return completer.future;
}
