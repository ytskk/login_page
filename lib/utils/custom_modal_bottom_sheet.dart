import 'package:flutter/material.dart';
import 'package:training_and_testing/constants/constants.dart';
import 'package:training_and_testing/theme/theme.dart';
import 'package:training_and_testing/widgets/widgets.dart';

/// Wrapper on default [showModalBottomSheet] with custom background color
/// and rounded corners.
Future<T?> showCustomModalBottomSheet<T>({
  required BuildContext context,
  required Widget child,
  Widget? title,
  Widget? trailing,
  bool isScrollControlled = false,
}) async {
  final backgroundColor = Theme.of(context).colorScheme.grey90;

  return showModalBottomSheet(
    context: context,
    useRootNavigator: true,
    backgroundColor: backgroundColor,
    isScrollControlled: isScrollControlled,
    constraints: BoxConstraints(
      maxHeight: MediaQuery.of(context).size.height * 0.8,
    ),
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(
        top: Radius.circular(borderRadius24),
      ),
    ),
    builder: (_) => ModalBottomSheetWrapper(
      title: title,
      trailing: trailing,
      content: child,
    ),
  );
}
