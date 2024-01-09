import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture_template/core/constants/assets.dart';
import 'package:flutter_clean_architecture_template/core/widgets/images/cache_manager.dart';

class CustomCachedNetworkImage extends StatelessWidget {
  const CustomCachedNetworkImage({
    super.key,
    required this.url,
    required this.fit,
    this.height,
    this.width,
    this.color,
    this.placeholder,
    this.placeholderFit,
    this.alignment = Alignment.center,
    this.customPlaceHolder,
  });

  final String url;
  final BoxFit fit;
  final double? height;
  final double? width;
  final Color? color;
  final BoxFit? placeholderFit;
  final String? placeholder;
  final Alignment alignment;
  final Widget? customPlaceHolder;

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: url,
      fit: fit,
      height: height,
      width: width,
      color: color,
      alignment: alignment,
      cacheManager: CustomCacheManager.instance,
      errorWidget: (a, b, c) =>
          customPlaceHolder ??
          Image.asset(
            placeholder ?? Assets.fallbackImage,
            fit: placeholderFit ?? fit,
            height: height,
            alignment: alignment,
            width: width,
          ),
      placeholder: (a, c) =>
          customPlaceHolder ??
          Image.asset(
            placeholder ?? Assets.fallbackImage,
            fit: placeholderFit ?? fit,
            height: height,
            alignment: alignment,
            width: width,
          ),
    );
  }
}
