// base text style

import 'package:flutter/material.dart';
import 'package:training_and_testing/constants/constants.dart';

TextStyle baseTextStyle = const TextStyle(
  fontSize: 16,
  height: 1.4,
  color: AppColors.white,
);

// hero
TextStyle heroTextStyle = baseTextStyle.copyWith(
  fontWeight: FontWeight.w800,
  fontSize: 24,
  height: 1.1,
);

// h1
TextStyle h1TextStyle = baseTextStyle.copyWith(
  fontWeight: FontWeight.w500,
  fontSize: 22,
  height: 1.1,
);

// h2
TextStyle h2TextStyle = baseTextStyle.copyWith(
  fontWeight: FontWeight.w500,
  fontSize: 18,
  height: 1.1,
);

// h3
TextStyle h3TextStyle = baseTextStyle.copyWith(
  fontWeight: FontWeight.w700,
  fontSize: 12,
  height: 1.67,
);

// body L
TextStyle bodyLTextStyle = baseTextStyle.copyWith(
  fontSize: 18,
  height: 1.4,
);

// body M
TextStyle bodyMTextStyle = baseTextStyle.copyWith(
  fontSize: 14,
  height: 1.4,
);

// body S
TextStyle bodySTextStyle = baseTextStyle.copyWith(
  fontSize: 12,
  height: 1.4,
);

// button L
TextStyle buttonLTextStyle = baseTextStyle.copyWith(
  fontWeight: FontWeight.w500,
  fontSize: 18,
  height: 1.33,
);

// button S
TextStyle buttonSTextStyle = baseTextStyle.copyWith(
  fontWeight: FontWeight.w700,
  fontSize: 14,
  height: 1.14,
);

// caption
TextStyle captionTextStyle = baseTextStyle.copyWith(
  fontWeight: FontWeight.w600,
  fontSize: 10,
  height: 1.4,
);

// Title
TextStyle titleTextStyle = baseTextStyle.copyWith(
  fontWeight: FontWeight.w800,
  fontSize: 40,
  height: 1.2,
  letterSpacing: 2
);