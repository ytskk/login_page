import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

/// String expansion method for formatting
/// dates depending on localization
extension DateLocalizationStringExtension on String {
  /// returns the date depending on the localization
  String trd(Locale locale) {
    try {
      return DateFormat.yMd(locale.toString()).format(DateTime.parse(this));
    } catch (_) {
      return 'undefined';
    }
  }
}

/// {@template cast_string_to_enum}
/// A [String] extension method that returns [Enum] 
/// according to current [String]. 
/// Returns null if value is missing.
/// {@endtemplate}
extension CastStringToEnumExtension on String {
  /// {@macro cast_string_to_enum}
  T? toEnum<T>(List<T> values) {
    return values.firstWhereOrNull(
      (type) => type.toString().split('.').last == this,
    );
  }
}
