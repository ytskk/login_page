import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:reactive_forms_lbc/reactive_forms_lbc.dart';
import 'package:training_and_testing/constants/constants.dart';
import 'package:training_and_testing/theme/theme.dart';
import 'package:training_and_testing/utils/extensions/extensions.dart';
import 'package:training_and_testing/widgets/widgets.dart';

enum TextFormFieldType { basic, action, button }

class CustomTextFormField extends StatelessWidget {
  CustomTextFormField._({
    required this.form,
    required this.controlName,
    this.initalValue,
    this.lable,
    this.hint,
    this.onTap,
    this.disabled,
    this.readOnly,
    this.keyboardType,
    this.buttonText,
    this.buttonOnPressed,
    this.validators,
    this.formatters,
    this.textFormFieldType = TextFormFieldType.basic,
  });

  factory CustomTextFormField.basic({
    required FormGroup form,
    required String controlName,
    String? initalValue,
    String? lable,
    TextInputType? keyboardType,
    bool? disabled,
    List<TextInputFormatter>? formatters,
    List<Map<String, dynamic>? Function(AbstractControl<dynamic>)>? validators,
  }) {
    return CustomTextFormField._(
      form: form,
      controlName: controlName,
      initalValue: initalValue,
      lable: lable,
      disabled: disabled,
      validators: validators,
      formatters: formatters,
      keyboardType: keyboardType,
    );
  }

  factory CustomTextFormField.action({
    required FormGroup form,
    required String controlName,
    String? initalValue,
    String? hint,
    bool? disabled,
    Function(FormControl<String>)? onTap,
    List<Map<String, dynamic>? Function(AbstractControl<dynamic>)>? validators,
  }) {
    return CustomTextFormField._(
      form: form,
      controlName: controlName,
      hint: hint,
      initalValue: initalValue,
      onTap: onTap,
      disabled: disabled,
      readOnly: true,
      keyboardType: TextInputType.none,
      validators: validators,
      textFormFieldType: TextFormFieldType.action,
    );
  }

  factory CustomTextFormField.button({
    required FormGroup form,
    required String controlName,
    String? initalValue,
    String? buttonText,
    String? lable,
    bool? disabled,
    TextInputType? keyboardType,
    List<TextInputFormatter>? formatters,
    Function()? buttonOnPressed,
    List<Map<String, dynamic>? Function(AbstractControl<dynamic>)>? validators,
  }) {
    return CustomTextFormField._(
      form: form,
      controlName: controlName,
      lable: lable,
      initalValue: initalValue,
      buttonText: buttonText,
      disabled: disabled,
      buttonOnPressed: buttonOnPressed,
      keyboardType: keyboardType,
      validators: validators,
      formatters: formatters,
      textFormFieldType: TextFormFieldType.button,
    );
  }

  final FormGroup form;

  final String controlName;

  final String? initalValue;

  final String? lable;

  final String? hint;

  final String? buttonText;

  final bool? disabled;

  final bool? readOnly;

  final TextInputType? keyboardType;

  final List<TextInputFormatter>? formatters;

  final List<Map<String, dynamic>? Function(AbstractControl<dynamic>)>?
      validators;

  final TextFormFieldType textFormFieldType;

  Function(FormControl<String>)? onTap;

  Function()? buttonOnPressed;

  bool isFocused = false;

  InputDecoration _decoration = const InputDecoration();

  final focusNode = FocusNode();

  // getters

  bool get _disabled => disabled ?? false;

  bool get _readOnly => readOnly ?? false;

  void _setDefaultDecoration(BuildContext context) {
    _decoration = _decoration.copyWith(
      enabledBorder: CustomInputBorder(
        borderSide: BorderSide(
          color: _checkEmpty(form.control(controlName))
              ? Theme.of(context).colorScheme.white
              : Theme.of(context).colorScheme.white.withOpacity(0.4),
        ),
      ),
    );
  }

  void _buildBasicField() {
    //
    _decoration = _decoration.copyWith(
      labelText: lable ?? controlName,
    );
  }

  void _buildActionField() {
    //
    _decoration = _decoration.copyWith(
      hintText: hint ?? controlName,
      suffixIcon: _BuildSuffixIcon(focusStatus: isFocused),
      suffixIconConstraints: BoxConstraints.loose(Size.infinite),
    );

    final callback = onTap;

    onTap = (FormControl<String> _) {
      callback?.call(_);
      WidgetsBinding.instance.addPostFrameCallback(
        (_) => focusNode.requestFocus(),
      );
    };
  }

  void _buildButtonFormField() {
    _decoration = _decoration.copyWith(
      labelText: lable ?? controlName,
      suffix: _BuildSuffixButton(
        action: buttonOnPressed,
        buttonText: buttonText,
      ),
    );
  }

  void _buildFieldByType(BuildContext context) {
    _setDefaultDecoration(context);

    switch (textFormFieldType) {
      case TextFormFieldType.action:
        _buildActionField();
        break;
      case TextFormFieldType.basic:
        _buildBasicField();
        break;
      case TextFormFieldType.button:
        _buildButtonFormField();
        break;
    }
  }

  bool _checkEmpty(AbstractControl<dynamic> control) {
    if (control.value == null) {
      return false;
    } else if (control.value is String) {
      return (control.value as String).trim().isNotEmpty;
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    //
    form.addAll({
      controlName: FormControl<String>(
        value: initalValue,
        validators: validators ?? [],
        disabled: _disabled,
      )
    });

    //
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: padding16),
      child: ReactiveFormControlFocusConsumer(
        builder: (BuildContext context, AbstractControl<String> control) {
          _buildFieldByType(context);
          return ReactiveTextField<String>(
            inputFormatters: [...?formatters],
            formControlName: controlName,
            readOnly: _readOnly,
            onTap: onTap,
            keyboardType: keyboardType,
            style: Theme.of(context).textTheme.bodyL.light.copyWith(
                  color: _disabled
                      ? Theme.of(context).colorScheme.white.withOpacity(0.5)
                      : Theme.of(context).colorScheme.white,
                ),
            decoration: _decoration,
            focusNode: focusNode,
          );
        },
        listener: (BuildContext context, AbstractControl<dynamic> control) {},
        listenWhen: (control, preValue, curValue) => isFocused = curValue,
        formControl: form.controls[controlName]! as FormControl<String>,
      ),
    );
  }
}

class _BuildSuffixIcon extends StatelessWidget {
  const _BuildSuffixIcon({required this.focusStatus});

  final bool focusStatus;

  @override
  Widget build(BuildContext context) {
    if (focusStatus) {
      return SvgAsset.squared(
        assetName: AppIcons.minusIcon,
        color: Theme.of(context).colorScheme.blue50,
      );
    } else {
      return SvgAsset.squared(
        assetName: AppIcons.addIcon,
        color: Theme.of(context).colorScheme.white.withOpacity(0.4),
      );
    }
  }
}

class _BuildSuffixButton extends StatelessWidget {
  const _BuildSuffixButton({required this.action, this.buttonText});

  final Function()? action;

  final String? buttonText;

  @override
  Widget build(BuildContext context) {
    return BrandButton(
      type: ButtonType.secondary,
      padding:
          const EdgeInsets.symmetric(vertical: padding4, horizontal: padding16),
      onPressed: action,
      child: Text(
        buttonText ?? '',
        style: Theme.of(context).textTheme.bodyS.semibold,
      ),
    );
  }
}
