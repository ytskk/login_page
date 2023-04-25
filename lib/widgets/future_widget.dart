import 'package:flutter/material.dart';
import 'package:training_and_testing/constants/app_styles.dart';

import 'preloader.dart';

class FutureWidget extends StatelessWidget {
  final Future future;
  final Widget widget;

  const FutureWidget(this.future, this.widget, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: future,
        builder: (BuildContext context, AsyncSnapshot snapshot) {
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
        });
  }
}
