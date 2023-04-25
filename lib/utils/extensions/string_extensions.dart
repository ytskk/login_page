import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
/// String expansion method for formatting 
/// dates depending on localization
extension DateLocalizationStringExtension on String {
  /// returns the date depending on the localization
  String trd(BuildContext context){
    try {
      // !!!
      return DateFormat.yMd(context.locale.toString())
          .format(DateTime.parse(this));
    } catch (_) {
      return 'undefined';
    }
  }
}
