import 'package:flutter/material.dart';

/// {@template remote_image}
/// Displays an image from the network.
/// {@endtemplate}
class RemoteImage extends StatelessWidget {
  /// {@macro remote_image}
  const RemoteImage({
    required this.imageUrl,
    this.width,
    this.height,
    this.fit,
    super.key,
  });

  final String imageUrl;
  final double? width;
  final double? height;
  final BoxFit? fit;

  @override
  Widget build(BuildContext context) {
    return Image.network(
      imageUrl,
      fit: fit ?? BoxFit.contain,
      width: width,
      height: height,
    );
  }
}
