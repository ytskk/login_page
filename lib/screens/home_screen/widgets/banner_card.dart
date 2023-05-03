import 'package:flutter/material.dart';
import 'package:training_and_testing/widgets/widgets.dart';

/// {@template banner_card}
/// Card widget to display in [SliderCardWidget].
/// {@endtemplate}
class BannerCard extends StatelessWidget {
  /// {@macro banner_card}
  const BannerCard({
    required this.child,
    super.key,
    this.backgroundImage,
    this.cardColor,
    this.backgroundImageAlignment,
  });

  /// Background color [BannerCard]
  final Color? cardColor;

  /// Contents of [BannerCard]
  final Widget child;

  /// Background image [BannerCard]
  final Widget? backgroundImage;

  /// Aligning [backgroundImage] inside [BannerCard]
  final AlignmentGeometry? backgroundImageAlignment;

  @override
  Widget build(BuildContext context) {
    return RoundedRectangleBox(
      backgroundColor: cardColor,
      child: BackgroundImageCard(
        backgroundImage: backgroundImage,
        backgroundImageAlignment: backgroundImageAlignment,
        child: child,
      ),
    );
  }
}
