import 'package:flutter/material.dart';

class AnimatedAppearanceWidget extends StatefulWidget {
  final Widget child;
  final Duration duration;
  final Curve curve;

  const AnimatedAppearanceWidget({
    required this.child,
    super.key,
    this.duration = const Duration(seconds: 5),
    this.curve = Curves.easeIn,
  });

  @override
  _AnimatedAppearanceWidgetState createState() =>
      _AnimatedAppearanceWidgetState();
}

class _AnimatedAppearanceWidgetState extends State<AnimatedAppearanceWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: widget.duration,
    );
    final Animation<double> curve =
        CurvedAnimation(parent: _controller, curve: Curves.easeOut);
    _animation = Tween<double>(begin: 1.0, end: 100.0).animate(_controller);

    // Start the animation
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: _animation,
        builder: (context, child) {
          return Transform.scale(
            scale: _animation.value / 100,
            origin: Offset(0, _animation.value),
            child: widget.child,
          );
        });
  }
}
