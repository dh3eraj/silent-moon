import 'package:flutter/material.dart';

class Breathing extends StatefulWidget {
  final Widget child;
  final Duration duration;
  final bool withOpacity;
  const Breathing({
    super.key,
    required this.child,
    this.duration = const Duration(seconds: 3),
  }) : withOpacity = false;

  const Breathing.opacity({
    super.key,
    required this.child,
    this.duration = const Duration(seconds: 3),
  }): withOpacity = true;

  @override
  State<Breathing> createState() => _BreathingState();
}

class _BreathingState extends State<Breathing>
    with SingleTickerProviderStateMixin {
  late final AnimationController _animationController;
  late final Animation _animation;

  @override
  void initState() {
    _animationController = AnimationController(
      vsync: this,
      duration: widget.duration,
    );
    _animation = Tween<double>(
      begin: 0.5,
      end: 1,
    ).animate(_animationController);
    _animationController.repeat(reverse: true);
    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animationController,
      builder: (context, child) {
        return Opacity(
          opacity:widget.withOpacity ? _animation.value :1,
          child: Transform.scale(scale: _animation.value, child: widget.child),
        );
      },
    );
  }
}
