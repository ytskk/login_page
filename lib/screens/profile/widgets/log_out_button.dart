import 'package:flutter/material.dart';
import 'package:training_and_testing/constants/constants.dart';
import 'package:training_and_testing/theme/theme.dart';
import 'package:training_and_testing/utils/utils.dart';
import 'package:training_and_testing/widgets/widgets.dart';

class LogOutButtonWidget extends StatelessWidget {
  const LogOutButtonWidget({
    required this.text,
    this.color,
    this.textStyle,
    this.onPressed,
    super.key, 
  });

  final String text;

  final Color? color;

  final TextStyle? textStyle;

  final Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    final appTheme = Theme.of(context);

    final mainColor = color ?? appTheme.colorScheme.red;

    return OutlinedButton(
      onPressed: onPressed,
      style: OutlinedButton.styleFrom(
        padding: const EdgeInsets.all(padding16),
        side: BorderSide(color: mainColor.withOpacity(0.5)),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadius16),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            textAlign: TextAlign.center,
            text,
            style: textStyle ??
                appTheme.textTheme.bodyM.medium
                    .copyWith(color: appTheme.colorScheme.white),
          ),
          SvgAsset.squared(
            assetName: AppIcons.logOutIcon,
            size: iconSize24,
            color: mainColor,
          ),
        ],
      ),
    );
  }
}
