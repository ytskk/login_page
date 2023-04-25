import 'package:easy_localization/easy_localization.dart';

/// [Enum] extansion method for translating 
/// [Enum] to [String] depending on localization
extension EnumTranslationExtension on Enum {
  /// returns [String] depending on the localization
  String trEnum(){
    try {
      return 'enums.${toString()}'.tr();
    } catch (_) {
      return toString();
    }
  }
}
