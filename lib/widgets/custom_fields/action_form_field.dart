import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:training_and_testing/constants/constants.dart';
import 'package:training_and_testing/theme/theme.dart';
import 'package:training_and_testing/utils/utils.dart';
import 'package:training_and_testing/widgets/widgets.dart';

class ActionFormField extends CustomFormField {
  ActionFormField({
    required super.form,
    required super.controlName,
    super.initialValue,
    super.hint,
    this.onTap,
    super.disabled,
    super.validators,
    super.key,
  }): super(
    readOnly: true,
    keyboardType: TextInputType.none,
  );

  final Function()? onTap;

  bool _isOpened = false;

  @override
  void buildDecoration(BuildContext context) {
      decoration = decoration.copyWith(
      hintText: hint ?? controlName,
      enabledBorder: _isOpened
          ? context.theme.inputDecorationTheme.focusedBorder
          : CustomInputBorder(
              borderSide: BorderSide(
                color: checkEmpty(form.control(controlName))
                    ? Theme.of(context).colorScheme.white
                    : Theme.of(context).colorScheme.white.withOpacity(0.4),
              ),
            ),
      suffixIcon: _BuildSuffixIcon(focusStatus: _isOpened),
      suffixIconConstraints: BoxConstraints.loose(Size.infinite),
    );
  }

  @override
  Future<void> Function(dynamic _) onTap_(BuildContext context) {
    return (_) async {
      _isOpened = true;
      // TODO:
      await showCustomModalBottomSheet<void>(
        context: context,
        child: const Text('data'),
      );
      _isOpened = false;
    };
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
