import 'package:flutter/material.dart';

class CustomInputBorder extends UnderlineInputBorder {
  const CustomInputBorder({
    super.borderSide = const BorderSide(),
    super.borderRadius = const BorderRadius.only(
      topLeft: Radius.circular(4),
      topRight: Radius.circular(4),
    ),
  });

  @override
  bool get isOutline => true;
}
