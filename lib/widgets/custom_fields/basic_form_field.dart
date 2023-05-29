import 'package:flutter/material.dart';
import 'package:training_and_testing/widgets/custom_fields/custom_form_fields.dart';

class BasicFormField extends CustomFormField {
  BasicFormField({
    required super.form,
    required super.controlName,
    super.initialValue,
    super.label,
    super.keyboardType,
    super.disabled,
    super.formatters,
    super.validators,
    super.key,
  });

  @override
  void buildDecoration(BuildContext context) {
    decoration = decoration.copyWith(labelText: label ?? controlName);
  }
}
