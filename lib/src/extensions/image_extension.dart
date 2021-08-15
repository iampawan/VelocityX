import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/flutter_svg.dart';

extension ImgExtension on String? {
  /// Helps in loading network image from imageURL
  Widget loadNetworkImage(
          {double? height,
          double? width,
          BoxFit? fit,
          Widget? errorWidget,
          Widget? placeHolder}) =>
      CachedNetworkImage(
          placeholder: (BuildContext c, String s) => placeHolder ?? Container(),
          fit: fit ?? BoxFit.fill,
          height: height,
          width: width,
          errorWidget: (_, __, ___) => errorWidget ?? Container(),
          imageUrl: this!);

  /// Helps in rendering SVG Picture
  Widget svgAssetImage(
          {double? width,
          double? height,
          Color? color,
          BoxFit? fit,
          AlignmentDirectional alignment = AlignmentDirectional.center,
          bool? matchTxtDir,
          Widget? placeHolder}) =>
      SvgPicture.asset(
        this!,
        matchTextDirection: matchTxtDir ?? true,
        width: width,
        color: color,
        height: height,
        fit: fit ?? BoxFit.fill,
        placeholderBuilder: (context) => placeHolder ?? Container(),
        alignment: alignment,
      );
}
