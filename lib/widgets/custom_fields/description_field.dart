import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:training_and_testing/constants/app_icons.dart';
import 'package:training_and_testing/constants/app_styles.dart';
import 'package:training_and_testing/theme/app_colors.dart';
import 'package:training_and_testing/theme/app_typography.dart';
import 'package:training_and_testing/utils/extensions/extensions.dart';
import 'package:training_and_testing/widgets/svg_asset.dart';

class DropDownTextWidget extends StatefulWidget {
  const DropDownTextWidget({
    required this.title,
    required this.description,
    super.key,
  });

  final String title;
  final String description;

  @override
  State<DropDownTextWidget> createState() => _DropDownTextWidgetState();
}

class _DropDownTextWidgetState extends State<DropDownTextWidget>
    with TickerProviderStateMixin {
  String get title => widget.title;

  String get description => widget.description;

  late final AnimationController _controller;
  late final Animation<double> _animation;

  bool isOpened = false;

  @override
  void initState() {
    //
    _controller = AnimationController(
      duration: const Duration(milliseconds: 250),
      vsync: this,
    );

    //
    _animation = CurvedAnimation(
      parent: _controller,
      curve: Curves.linear,
      reverseCurve: Curves.fastOutSlowIn,
    );

    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Widget _buildHeader(BuildContext context) {
    return GestureDetector(
      onTap: () => setState(() {
        isOpened = !_controller.isCompleted;
      }),
      child: DecoratedBox(
        decoration: BoxDecoration(
          border: Border(
            bottom: !isOpened & !_controller.isAnimating
                ? BorderSide(
                    color: Theme.of(context).colorScheme.white.withOpacity(0.4),
                  )
                : BorderSide.none,
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Text(
                title,
                style: Theme.of(context).textTheme.bodyL.semibold,
              ),
            ),
            if (isOpened)
              SvgAsset(
                assetName: AppIcons.chevronUp,
                color: Theme.of(context).colorScheme.white,
              )
            else
              SvgAsset(
                assetName: AppIcons.chevronDown,
                color: Theme.of(context).colorScheme.white.withOpacity(0.4),
              ),
          ],
        ).paddingSymmetric(vertical: padding16),
      ),
    );
  }

  Widget _buildDescriptionField(BuildContext context) {
    return Container(
      width: double.maxFinite,
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: isOpened
                ? Theme.of(context).colorScheme.grey10
                : Theme.of(context).colorScheme.white.withOpacity(0.4),
          ),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.only(bottom: padding24),
        child: Text(
          description,
          style: Theme.of(context).textTheme.bodyM.light,
        ),
      ),
    ).paddingZero;
  }

  @override
  Widget build(BuildContext context) {
    isOpened ? _controller.forward() : _controller.reverse();
    // .whenComplete(() => setState(() {}));

    _controller.addListener(() {
      if (_controller.value == 0) {
        setState(() {});
      }
    });

    return Column(
      children: [
        _buildHeader(context),
        Container(
          constraints: BoxConstraints(
            maxHeight: MediaQuery.of(context).size.height / 2,
          ),
          child: SingleChildScrollView(
            child: SizeTransition(
              axisAlignment: 1,
              sizeFactor: _animation,
              child: _buildDescriptionField(context).paddingZero,
            ),
          ),
        ),
      ],
    );
  }
}
