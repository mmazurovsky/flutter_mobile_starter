import 'package:flutter/material.dart';

class SlideAnimationWrapper extends StatefulWidget {
  final Widget child;
  const SlideAnimationWrapper({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  _SlideAnimationWrapperState createState() => _SlideAnimationWrapperState();
}

class _SlideAnimationWrapperState extends State<SlideAnimationWrapper>
    with SingleTickerProviderStateMixin {
  late Animation<Offset> _offsetAnimation;
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 250),
      vsync: this,
    )..forward();
    _offsetAnimation = Tween<Offset>(
      begin: const Offset(0, 1),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeOutCubic,
    ));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SlideTransition(
      position: _offsetAnimation,
      child: widget.child,
    );
  }
}

class BlinkAnimationWrapper extends StatefulWidget {
  final Function(Color) widgetBuilder;
  final Color startColor;
  final Color endColor;
  const BlinkAnimationWrapper({
    Key? key,
    required this.widgetBuilder,
    required this.startColor,
    required this.endColor,
  }) : super(key: key);

  @override
  _BlinkAnimationWrapperState createState() => _BlinkAnimationWrapperState();
}

class _BlinkAnimationWrapperState extends State<BlinkAnimationWrapper>
    with SingleTickerProviderStateMixin {
  late Animation<Color?> _colorAnimation;
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    )..repeat(reverse: true);
    _colorAnimation = ColorTween(
      begin: widget.startColor,
      end: widget.endColor,
    ).animate(_controller);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _colorAnimation,
      builder: (context, child) => widget.widgetBuilder(_colorAnimation.value!),
    );
  }
}

class ScaleAnimationWrapper extends StatefulWidget {
  final Widget child;
  final double lowerBound;
  const ScaleAnimationWrapper({
    Key? key,
    required this.child,
    this.lowerBound = 0.5,
  }) : super(key: key);

  @override
  _ScaleAnimationWrapperState createState() => _ScaleAnimationWrapperState();
}

class _ScaleAnimationWrapperState extends State<ScaleAnimationWrapper>
    with SingleTickerProviderStateMixin {
  late Animation<double> _animation;
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 400),
      vsync: this,
      lowerBound: widget.lowerBound,
      upperBound: 1,
    );
    _animation = CurvedAnimation(
      curve: Curves.easeInOutQuint,
      parent: _controller,
    );
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ScaleTransition(
      scale: _animation,
      child: widget.child,
    );
  }
}
