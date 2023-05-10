import 'package:flutter/material.dart';

class ShimmerSwitchWidget extends StatelessWidget {
  const ShimmerSwitchWidget({
    this.isShimmerActive = true,
    this.child,
    this.shimmer,
    super.key,
  }) : assert(
          child != null || shimmer != null,
          'Either child or shimmer must be provided',
        );

  final Widget? child;
  final Widget? shimmer;
  final bool isShimmerActive;

  @override
  Widget build(BuildContext context) {
    if (isShimmerActive) {
      return shimmer ?? child!;
    }

    return child ?? shimmer!;
  }
}
