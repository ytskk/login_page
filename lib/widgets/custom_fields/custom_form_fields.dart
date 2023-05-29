import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:reactive_forms_lbc/reactive_forms_lbc.dart';
import 'package:training_and_testing/constants/constants.dart';
import 'package:training_and_testing/theme/theme.dart';
import 'package:training_and_testing/widgets/widgets.dart';

abstract class CustomFormField extends StatelessWidget {
  CustomFormField({
    required this.form,
    required this.controlName,
    this.initialValue,
    this.label,
    this.hint,
    this.disabled,
    this.readOnly,
    this.keyboardType,
    this.validators,
    this.formatters,
    super.key,
  });

  final FormGroup form;

  final String controlName;

  final String? initialValue;

  final String? label;

  final String? hint;

  final bool? disabled;

  final bool? readOnly;

  final TextInputType? keyboardType;

  final List<TextInputFormatter>? formatters;

  final List<Map<String, dynamic>? Function(AbstractControl<dynamic>)>?
      validators;

  InputDecoration decoration = const InputDecoration();

  // getters

  bool get _disabled => disabled ?? false;

  bool get _readOnly => readOnly ?? false;

  void _setDefaultDecoration(BuildContext context) {
    decoration = decoration.copyWith(
      enabledBorder: CustomInputBorder(
        borderSide: BorderSide(
          color: checkEmpty(form.control(controlName))
              ? Theme.of(context).colorScheme.white
              : Theme.of(context).colorScheme.white.withOpacity(0.4),
        ),
      ),
    );
  }

  bool checkEmpty(AbstractControl<dynamic> control) {
    if (control.value == null) {
      return false;
    } else if (control.value is String) {
      return (control.value as String).trim().isNotEmpty;
    }
    return false;
  }

  void buildDecoration(BuildContext context);

  Future<void> Function(dynamic _)? onTap_(BuildContext context) => null;

  @override
  Widget build(BuildContext context) {
    //
    form.addAll({
      controlName: FormControl<String>(
        value: initialValue,
        validators: validators ?? [],
        disabled: _disabled,
      )
    });

    //
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: padding16),
      child: ReactiveFormControlFocusConsumer(
        builder: (BuildContext context, AbstractControl<String> control) {
          _setDefaultDecoration(context);
          buildDecoration(context);
          return ReactiveTextField<String>(
            inputFormatters: [...?formatters],
            formControlName: controlName,
            readOnly: _readOnly,
            onTap: onTap_(context),
            keyboardType: keyboardType,
            style: TextStyle(
              color: _disabled
                  ? Theme.of(context).colorScheme.white.withOpacity(0.5)
                  : Theme.of(context).colorScheme.white,
            ),
            decoration: decoration,
          );
        },
        listener: (BuildContext context, AbstractControl<dynamic> control) {},
        formControl: form.controls[controlName]! as FormControl<String>,
      ),
    );
  }
}
