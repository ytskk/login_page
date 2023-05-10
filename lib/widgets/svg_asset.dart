import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

/// {@template svg_asset}
/// A widget that wraps an [SvgPicture] from an asset.
///
/// Since [SvgPicture.asset] color property is deprecated, this widget
/// will use [color] if it is not null to create a [ColorFilter] for
/// [SvgPicture.colorFilter], else it will use SVG native color.
/// {@endtemplate}
class SvgAsset extends StatelessWidget {
  /// {@macro svg_asset}
  const SvgAsset({
    required this.assetName,
    this.color,
    this.width,
    this.height,
    this.onTap,
    super.key,
  });

  const factory SvgAsset.squared({
    required String assetName,
    Color? color,
    double? size,
    Function()? onTap,
  }) = _SvgAssetSquare;

  final String assetName;
  final Color? color;
  final double? width;
  final double? height;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: SvgPicture.asset(
        assetName,
        width: width,
        height: height,
        colorFilter: color != null
            ? ColorFilter.mode(
                color!,
                BlendMode.srcIn,
              )
            : null,
      ),
    );
  }
}

class _SvgAssetSquare extends SvgAsset {
  const _SvgAssetSquare({
    required super.assetName,
    double? size,
    Function()? onTap,
    super.color,
  }) : super(
          width: size,
          height: size,
          onTap: onTap,
        );
}
