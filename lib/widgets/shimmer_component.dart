import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class Shimmer extends StatelessWidget {
  const Shimmer({
    this.width,
    this.height,
    this.color,
    this.borderRadius,
    super.key,
  });

  final double? width;
  final double? height;
  final Color? color;
  final double? borderRadius;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final shimmerColor =
        color ?? colorScheme.primaryContainer.withOpacity(0.15);

    return ClipRRect(
      borderRadius: BorderRadius.circular(borderRadius ?? 0),
      child: ColorFiltered(
        colorFilter: ColorFilter.mode(
          shimmerColor,
          BlendMode.src,
        ),
        child: ColoredBox(
          color: Colors.red,
          child: SizedBox(
            width: width,
            height: height,
            child: Text('123'),
          ),
        ),
      )
          .animate(
            onPlay: (controller) => controller.repeat(),
          )
          .shimmer(
            duration: 3.seconds,
            curve: Curves.fastEaseInToSlowEaseOut,
          ),
    );
  }
}
