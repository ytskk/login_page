import 'package:flutter/material.dart';
import 'package:training_and_testing/constants/app_styles.dart';

import 'package:training_and_testing/widgets/preloader.dart';

class FutureWidget extends StatelessWidget {
  const FutureWidget(this.future, this.widget, {super.key});
  final Future<dynamic> future;
  final Widget widget;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: future,
      builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
        if (snapshot.connectionState != ConnectionState.done) {
          return const Center(
            child: PreloaderProgressIndicator(size: iconSize32),
          );
        }
        if (snapshot.hasError) {
          return Center(
            child: Text(
              snapshot.error.toString(),
              style: const TextStyle(color: Colors.white),
            ),
          );
        }
        return widget;
      },
    );
  }
}
