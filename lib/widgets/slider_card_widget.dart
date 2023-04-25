import 'package:flutter/material.dart';
import 'package:training_and_testing/theme/app_colors.dart';

import '../constants/constants.dart';
import 'widgets.dart';

class SliderCardWidget extends StatefulWidget {
  const SliderCardWidget({
    super.key,
    required this.items,
    required this.height,
  });

  final List<Widget> items;
  final double height;

  @override
  State<SliderCardWidget> createState() => _SliderCardWidgetState();
}

class _SliderCardWidgetState extends State<SliderCardWidget> {
  late final PageController _pageController;
  late int _currentPage = 0;

  @override
  void initState() {
    super.initState();

    _pageController = PageController(
      viewportFraction: 1.04,
      initialPage: _currentPage,
    );
  }

  @override
  Widget build(BuildContext context) {
    final appTheme = Theme.of(context);
    return Column(
      children: [
        RoundedRectangleBox(
          child: SizedBox(
            height: widget.height,
            child: PageView.builder(
              controller: _pageController,
              onPageChanged: (value) => setState(() {
                _currentPage = value;
              }),
              itemBuilder: (BuildContext context, int index) {
                return FractionallySizedBox(
                  widthFactor: 1 / _pageController.viewportFraction,
                  child: widget.items[index % widget.items.length],
                );
              },
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: spacing8),
          child: Wrap(
            spacing: spacing6,
            children: [
              ...List.generate(widget.items.length, (index) => index).map(
                (e) => SizedBox(
                  height: 6,
                  width: 6,
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      color: _currentPage % widget.items.length == e
                          ? Colors.white
                          : appTheme.colorScheme.grey50,
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  @override
  void dispose() {
    _pageController.dispose();

    super.dispose();
  }
}
