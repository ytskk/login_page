import 'package:flutter/material.dart';
import 'package:training_and_testing/constants/constants.dart';
import 'package:training_and_testing/utils/utils.dart';
import 'package:training_and_testing/widgets/widgets.dart';

// TODO: make more generic. New Widget: box with background image.
class BannerCard extends StatelessWidget {
  const BannerCard({
    super.key,
    required this.child,
    this.backgroundImage,
    this.cardColor,
    this.backgroundImageAlignment,
  });

  final Color? cardColor;
  final Widget child;
  final Widget? backgroundImage;
  final AlignmentGeometry? backgroundImageAlignment;

  @override
  Widget build(BuildContext context) {
    return RoundedRectangleBox(
      backgroundColor: cardColor,
      child: BackgroundImageCard(
        backgroundImage: Align(
          alignment: backgroundImageAlignment ?? Alignment.center,
          child: backgroundImage,
        ),
        child: child,
      ),
    );
  }
}
