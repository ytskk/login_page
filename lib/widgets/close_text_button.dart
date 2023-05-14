import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:training_and_testing/constants/constants.dart';

class CloseTextButton extends StatelessWidget {
  const CloseTextButton({
    this.onPressed,
    super.key,
  });

  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        if (onPressed != null) {
          return onPressed!();
        }

        return Navigator.of(context).pop();
      },
      child: Text(
        tr(AppStrings.close),
      ),
    );
  }
}
