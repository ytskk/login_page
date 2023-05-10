import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

/// {@template shimmer_loader}
/// A widget that displays a shimmer when [isLoading] is true.
///
/// If you don't plan to change isLoading and want to show an infinite shimmer,
/// define the widget via [shimmer].
/// {@endtemplate}
class ShimmerLoader extends StatelessWidget {
  /// {@macro shimmer_loader}
  const ShimmerLoader({
    this.isLoading = true,
    this.child,
    this.shimmer,
    this.shimmerColor,
    this.applyColorFilterToShimmer = true,
    this.useShimmerAnimation = true,
    this.shimmerBorderRadius,
    super.key,
  }) : assert(
          child != null || shimmer != null,
          'Either child or shimmer must be provided.',
        );

  /// A widget to be displayed when [isLoading] is false.
  final Widget? child;

  /// A widget to be displayed when [isLoading] is true.
  final Widget? shimmer;

  final bool isLoading;

  final bool useShimmerAnimation;

  /// Wrap shimmer with a [ColorFiltered] widget to apply a color to the shimmer.
  /// If it't false, the shimmer won't override the color. Consider that if you
  /// set true, you will hide the entire widget with a shimmer.
  final bool applyColorFilterToShimmer;

  /// Choose a color to apply to the shimmer. Recommended to add a low opacity.
  final Color? shimmerColor;

  /// Applies a border radius to the shimmer. It applies after color filter.
  final double? shimmerBorderRadius;

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      var shimmerChild = shimmer ?? child!;

      if (!useShimmerAnimation) {
        return shimmerChild;
      }

      // If child does not have a background color, ColorFiltered will not work.
      shimmerChild = ColoredBox(color: Colors.transparent, child: shimmerChild);

      if (applyColorFilterToShimmer) {
        final colorScheme = Theme.of(context).colorScheme;
        final _shimmerColor =
            shimmerColor ?? colorScheme.primaryContainer.withOpacity(0.15);

        shimmerChild = ColorFiltered(
          colorFilter: ColorFilter.mode(
            _shimmerColor,
            BlendMode.src,
          ),
          child: shimmerChild,
        );
      }

      if (shimmerBorderRadius != null) {
        shimmerChild = ClipRRect(
          borderRadius: BorderRadius.circular(shimmerBorderRadius!),
          child: shimmerChild,
        );
      }

      return shimmerChild
          .animate(
            onPlay: (controller) => controller.repeat(),
          )
          .shimmer(duration: const Duration(seconds: 1));
    }

    return child ?? shimmer!;
  }
}
