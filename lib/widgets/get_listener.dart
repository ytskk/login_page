import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GetListener<C extends GetxController> extends StatelessWidget {
  const GetListener({
    required this.listener,
    required this.child,
    required this.reactive,
    super.key,
    this.listenWhen,
  });

  final Widget child;
  final RxInterface<Object?> reactive;
  final void Function(BuildContext context, C controller) listener;
  final bool Function(C controller)? listenWhen;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<C>(
      // to get updated controller instance.
      filter: (controller) => listenWhen?.call(controller) ?? false,
      builder: (controller) {
        // Called every time [reactive] changes! As long as the [condition]
        // returns true.
        ever(
          reactive,
          (_) {
            listener(context, controller);
          },
          condition: () => listenWhen?.call(controller) ?? true,
        );

        return child;
      },
    );
  }
}
