
import 'package:flutter/widgets.dart';
import 'package:training_and_testing/utils/utils.dart';


import '../../constants/constants.dart';
import 'badges.dart';

class PointsBadge extends StatelessWidget{
  const PointsBadge(
    {super.key,
    required this.content,
    this.backgroundColor,
    this.contentColor,
    this.padding,
    this.borderRadius,
  });

  final String content;
  final Color? backgroundColor;
  final Color? contentColor;
  final EdgeInsets? padding;
  final double? borderRadius;
  
  @override
  Widget build(BuildContext context) {
    return InfoBadge(
      padding: padding,
      backgroundColor: backgroundColor,
      contentColor: contentColor,
      borderRadius: borderRadius,
      child: _buildChild(),
    );
  }

  Widget _buildChild() {
    final content = Text(
      this.content,
      style: captionTextStyle.semibold.copyWith(
        color: contentColor,
      ),
    );
    return content;
  }
}