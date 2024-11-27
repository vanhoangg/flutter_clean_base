import 'dart:async';

import 'package:flutter/widgets.dart';

// ignore: must_be_immutable
class LongPressGesture extends StatelessWidget {
  Timer? timer;
  final int milisecond;
  final Widget child;
  final VoidCallback onTrigger;

  LongPressGesture(
      {required this.milisecond,
      required this.child,
      required this.onTrigger,
      super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (_) {
        timer = Timer(Duration(milliseconds: milisecond), onTrigger);
      },
      onTapUp: (_) {
        timer?.cancel();
      },
      child: child,
    );
  }
}
