import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:training_and_testing/constants/constants.dart';
import 'package:training_and_testing/screens/screens.dart';
import 'package:training_and_testing/theme/theme.dart';
import 'package:training_and_testing/utils/utils.dart';
import 'package:training_and_testing/widgets/widgets.dart';

/// {@template description_card}
/// A card with a [description] text.
///
/// May contain an additional line with the date [date] above the description.
/// You can attach any [trailer] that will be displayed on the right side
/// to the line with the date.
///
/// used for:
/// - [OperationsBlock]
/// - [NotificationScreen]
/// {@endtemplate}
class DescriptionCard extends StatelessWidget {
  /// {@macro description_card}
  const DescriptionCard({
    required this.description,
    super.key,
    this.textStyle,
    this.maxLines,
    this.date,
    this.paddinng = const EdgeInsets.all(padding16),
    this.width,
    this.height,
    this.backgroundColor,
    this.trailer,
  });

  ///
  /// text displayed on [DescriptionCard]
  ///
  final String description;

  ///
  /// text style [description]
  ///
  final TextStyle? textStyle;

  ///
  /// maximum number of displayed lines text [description] on [DescriptionCard]
  ///
  final int? maxLines;

  ///
  /// text content of the additional line above the description.
  /// Expected date
  ///
  final String? date;

  ///
  /// internal margin [DescriptionCard]
  ///
  final EdgeInsets? paddinng;

  ///
  /// fixed width [DescriptionCard]
  ///
  final double? width;

  ///
  /// fixed height [DescriptionCard]
  ///
  final double? height;

  ///
  /// background color [DescriptionCard]
  ///
  final Color? backgroundColor;

  ///
  /// Additional widget attached to line above description
  ///
  final Widget? trailer;

  @override
  Widget build(BuildContext context) {
    final appTheme = Theme.of(context);
    return SizedBox(
      width: width,
      child: RoundedRectangleBox(
        innerPadding: paddinng,
        backgroundColor: backgroundColor,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // line above description
            Row(
              children: [
                if (date != null)
                  Text(
                    date ?? '',
                    style: appTheme.textTheme.bodyS.light.copyWith(
                      color: appTheme.colorScheme.white.withOpacity(0.5),
                    ),
                  ),
                if (trailer != null) ...[
                  Expanded(child: trailer!)
                ],
              ],
            ).paddingOnly(
              bottom: ((date != null) || (trailer != null)) ? padding8 : 0,
            ),
            // description text
            Text(
              description,
              maxLines: maxLines ?? 2,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.left,
              style: textStyle ??
                  appTheme.textTheme.bodyS.light
                      .copyWith(color: appTheme.colorScheme.white),
            )
          ],
        ),
      ),
    );
  }
}
