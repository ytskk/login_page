import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:training_and_testing/constants/app_styles.dart';

class BlockTemplate extends StatelessWidget {
  const BlockTemplate({
    super.key,
    this.header,
    this.body,
    this.inner,
    this.padding,
  });

  final Widget? header;

  final Widget? body;

  final double? inner;

  final EdgeInsets? padding;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding ?? const EdgeInsets.symmetric(vertical: padding16),
      child: Column(
        children: [
          if (header != null) header!.paddingOnly(bottom: inner ?? 16),
          if (body != null) body!,
        ],
      ),
    );
  }
}
