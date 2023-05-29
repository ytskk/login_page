import 'package:flutter/material.dart';
import 'package:training_and_testing/constants/constants.dart';
import 'package:training_and_testing/theme/theme.dart';
import 'package:training_and_testing/utils/extensions/extensions.dart';
import 'package:training_and_testing/widgets/widgets.dart';

class ButtonFormField extends CustomFormField{
  ButtonFormField({
    required super.form,
    required super.controlName,
    super.initialValue,
    super.label,
    super.disabled,
    super.keyboardType,
    super.formatters,
    super.validators,
    super.key,
    this.buttonText,
    this.buttonOnPressed,
  });

  final String? buttonText;
  final Function()? buttonOnPressed;

  @override
  void buildDecoration(BuildContext context) {
    decoration = decoration.copyWith(
      labelText: label ?? controlName,
      suffix: _BuildSuffixButton(
        action: buttonOnPressed,
        buttonText: buttonText,
      ),
    );
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
