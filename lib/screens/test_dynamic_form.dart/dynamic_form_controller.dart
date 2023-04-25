import 'package:get/get.dart';

class DynamicFormController extends GetxController {
  final values = <String, String>{}.obs;

  void updateValue(String fieldId, String value) {
    values[fieldId] = value;
  }
}