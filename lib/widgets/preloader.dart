import 'dart:math';

import 'package:flutter/material.dart';

class PreloaderProgressIndicator extends StatefulWidget {
  const PreloaderProgressIndicator({
    required this.size,
    super.key,
    this.color,
    this.durationMs = 300,
  });

  final double size;
  final Color? color;
  final int durationMs;

  @override
  PreloaderProgressIndicatorState createState() =>
      PreloaderProgressIndicatorState();
}

class PreloaderProgressIndicatorState extends State<PreloaderProgressIndicator>
    with SingleTickerProviderStateMixin {
  late final Animation<double> _animation;
  late final AnimationController _animationController;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: widget.durationMs),
    );

    _animation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(
        parent: _animationController..repeat(),
        curve: Curves.linear,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animation,
      builder: (BuildContext context, Widget? child) {
        var angle = _animation.value;
        if (angle <= 0.25) {
          angle = 0;
        } else if (angle <= 0.5) {
          angle = -pi / 2;
        } else if (angle <= 0.75) {
          angle = pi;
        } else {
          angle = pi / 2;
        }

        // TODO(Egor-OS): Replace png with svg.
        return Transform.rotate(
          angle: angle,
          child: SizedBox.square(
            dimension: widget.size,
            child: Image.asset(
              'assets/images/preloader.png',
              color: widget.color,
              fit: BoxFit.contain,
            ),
          ),
        );
      },
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }
}
