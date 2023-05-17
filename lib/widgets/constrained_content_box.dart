import 'package:flutter/material.dart';

class ConstrainedContentBox extends StatelessWidget {
  const ConstrainedContentBox({
    required this.child,
    super.key,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    final maxContentWidth = MediaQuery.of(context).size.width / 1.22;

    return Center(
      child: SizedBox(
        width: maxContentWidth,
        child: child,
      ),
    );
  }
}
