import 'package:flutter/material.dart';
import 'package:training_and_testing/constants/constants.dart';
import 'package:training_and_testing/models/models.dart';
import 'package:training_and_testing/screens/screens.dart';
import 'package:training_and_testing/theme/theme.dart';
import 'package:training_and_testing/utils/utils.dart';

/// {@template profile_preview}
/// [Row] showing the users profile icon and his full name.
///
/// may contain an additional [trailer] displayed at the end of the [Row].
///
/// used for:
/// - [ProfileScreen]
/// - [HomeScreen]
/// - [PreviewButtonWidget]
/// {@endtemplate}
class ProfilePreviewWidget extends StatelessWidget {
  /// {@macro profile_preview}
  const ProfilePreviewWidget({
    required this.profileInfo,
    this.sizeAvatar,
    this.spacing,
    this.trailer,
    this.textStyle,
    this.transposition = false,
    super.key,
  });

  ///
  /// Object with all information about the user
  ///
  final GoogleUserModel profileInfo;

  ///
  /// diameter of the circle with the users avatar
  ///
  final double? sizeAvatar;

  ///
  /// indent between avatar and full name
  ///
  final double? spacing;

  ///
  /// display the first and last name in two lines
  ///
  final bool transposition;

  ///
  /// additional widget displayed at the end of the [Row]
  ///
  final Widget? trailer;

  ///
  /// text style for full name
  ///
  final TextStyle? textStyle;

  @override
  Widget build(BuildContext context) {
    final appTheme = Theme.of(context);
    return Row(
      children: [
        // profile avatar
        SizedBox.square(
          dimension: sizeAvatar ?? iconSize50,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(100),
            child: Image.network(
              profileInfo.photoUrl,
              fit: BoxFit.cover,
            ),
          ),
        ),
        SizedBox(width: spacing),
        // full name
        Text(
          [profileInfo.firstName, profileInfo.lastName]
              .join(transposition ? '\n' : ' '),
          style: textStyle ??
              appTheme.textTheme.bodyM.medium
                  .copyWith(color: appTheme.colorScheme.white),
        ),
        const Spacer(),
        // trailer
        trailer ?? const SizedBox()
      ],
    );
  }
}
