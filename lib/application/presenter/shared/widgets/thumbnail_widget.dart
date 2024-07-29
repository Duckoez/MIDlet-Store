import 'package:flutter/material.dart';

import '../../../core/enumerations/palette_enumeration.dart';

/// Creates a [Widget] that shows an thumbnail image.
class Thumbnail extends StatelessWidget {

  const Thumbnail({
    this.border,
    this.borderRadius,
    required this.image,
    this.filterQuality,
    super.key,
  });

  /// The border of the image.
  /// 
  /// If this parameter is not specified, a default value of [BoxBorder] is used.
  final BoxBorder? border;

  /// The border radius of the [Container].
  ///
  /// If this parameter is not specified, a default value of [BorderRadius] is used.
  final BorderRadius? borderRadius;

  /// The [ImageProvider] to be shown.
  final ImageProvider<Object> image;

  /// The quality filter of the image.
  /// 
  /// If this parameter is not specified, defaults to [FilterQuality.none].
  final FilterQuality? filterQuality;

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 0.75,
      child: Container(
        decoration: BoxDecoration(
          border: border ?? Border.all(
            color: Palette.transparent.color,
            width: 1,
          ),
          borderRadius: borderRadius ?? BorderRadius.circular(15),
          boxShadow: kElevationToShadow[3],
          color: Palette.foreground.color,
          image: DecorationImage(
            filterQuality: filterQuality ?? FilterQuality.high,
            fit: BoxFit.contain,
            image: image,
          ),
        ),
      ),
    );
  }
}