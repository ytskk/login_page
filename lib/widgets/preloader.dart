import 'dart:math';

import 'package:flutter/material.dart';

class PreloaderProgressIndicator extends StatefulWidget {
  final double size;
  final Color? color;
  final int durationMs;

  const PreloaderProgressIndicator({
    Key? key,
    required this.size,
    this.color,
    this.durationMs = 300,
  }) : super(key: key);

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

    _animation = Tween<double>(
      begin: 0,
      end: 1,
    ).animate(CurvedAnimation(
      parent: _animationController..repeat(),
      curve: Curves.linear,
    ));
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animation,
      builder: (BuildContext context, Widget? child) {
        double angle = _animation.value;
        if (angle <= 0.25) {
          angle = 0;
        } else if (angle <= 0.5) {
          angle = -pi / 2;
        } else if (angle <= 0.75) {
          angle = pi;
        } else {
          angle = pi / 2;
        }

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
