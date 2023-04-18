import 'package:flutter/material.dart';

/// {@template background_image_card}
/// Wrapper of [child] with [backgroundImage] that should be positioned
/// by themselves.
/// {@endtemplate}
class BackgroundImageCard extends StatelessWidget {
  /// {@macro background_image_card}
  const BackgroundImageCard({
    super.key,
    required this.child,
    this.backgroundImage,
  });

  final Widget child;
  final Widget? backgroundImage;

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        if (backgroundImage != null) backgroundImage!,
        child,
      ],
    );
  }
}
