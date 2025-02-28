import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:silent_moon/data/enums/image_types.dart';

class CustomImage extends StatelessWidget {
  final String src;
  final double? width;
  final double? height;
  final BoxFit? fit;
  final ImageTypes type;
  final FilterQuality? filterQuality;

  const CustomImage(
    this.src, {
    super.key,
    this.width,
    this.height,
    this.fit,
    this.filterQuality,
  }) : type = ImageTypes.normal;

  const CustomImage.svg(
    this.src, {
    super.key,
    this.width,
    this.height,
    this.fit,
  }) : type = ImageTypes.svg,
       filterQuality = null;

  @override
  Widget build(BuildContext context) {
    switch (type) {
      case ImageTypes.normal:
        return Image.asset(
          src,
          width: width,
          height: height,
          fit: fit,
          filterQuality: filterQuality ?? FilterQuality.medium,
        );
      case ImageTypes.svg:
        return SvgPicture.asset(
          src,
          width: width,
          height: height,
          fit: fit ?? BoxFit.contain,
        );
    }
  }
}
