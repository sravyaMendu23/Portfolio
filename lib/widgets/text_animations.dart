import 'dart:async';
import 'package:flutter/material.dart';
import 'package:visibility_detector/visibility_detector.dart';

import 'package:flutter/material.dart';
import 'package:visibility_detector/visibility_detector.dart';

class AnimatedTextReveal extends StatefulWidget {
  final String text;
  final TextStyle? style;
  final Duration duration;
  final double offsetX;
  final Duration initialDelay;

  const AnimatedTextReveal({
    Key? key,
    required this.text,
    this.style,
    this.duration = const Duration(milliseconds: 500),
    this.offsetX = 20.0,
    this.initialDelay = const Duration(milliseconds: 100),
  }) : super(key: key);

  @override
  State<AnimatedTextReveal> createState() => _AnimatedTextRevealState();
}

class _AnimatedTextRevealState extends State<AnimatedTextReveal> {
  late List<bool> _visibleList;
  bool _isAnimating = false;
  bool _wasVisible = false;

  @override
  void initState() {
    super.initState();
    _initVisibilityList();
  }

  void _initVisibilityList() {
    _visibleList = List.generate(widget.text.length, (_) => false);
  }

  Future<void> _runAnimation() async {
    _isAnimating = true;
    _initVisibilityList();
    if (!mounted) return;

    for (int i = 0; i < widget.text.length; i++) {
      await Future.delayed(widget.initialDelay + Duration(milliseconds: 5 * i));
      if (mounted) {
        setState(() {
          _visibleList[i] = true;
        });
      }
    }

    // Wait a little after full animation finishes before allowing next one
    await Future.delayed(const Duration(milliseconds: 1000));
    _isAnimating = false;
  }

  void _onVisibilityChanged(VisibilityInfo info) {
    final visible = info.visibleFraction > 0.5;

    if (visible && !_wasVisible && !_isAnimating) {
      _wasVisible = true;
      _runAnimation();
    } else if (!visible && _wasVisible) {
      _wasVisible = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return VisibilityDetector(
      key: UniqueKey(),
      onVisibilityChanged: _onVisibilityChanged,
      child: Wrap(
        children: List.generate(widget.text.length, (i) {
          final char = widget.text[i];
          if (char == ' ') return const SizedBox(width: 8.0);

          return AnimatedOpacity(
            opacity: _visibleList[i] ? 1.0 : 0.0,
            duration: widget.duration,
            curve: Curves.easeOutExpo,
            child: AnimatedSlide(
              offset: _visibleList[i]
                  ? Offset.zero
                  : Offset(widget.offsetX / 100, 0),
              duration: widget.duration,
              curve: Curves.easeOutExpo,
              child: Text(char, style: widget.style),
            ),
          );
        }),
      ),
    );
  }
}

enum SlideDirection { left, right }

class SlideFadeAnimation extends StatefulWidget {
  final Widget child;
  final SlideDirection direction;
  final Duration duration;
  final Duration delay;

  const SlideFadeAnimation({
    Key? key,
    required this.child,
    this.direction = SlideDirection.left,
    this.duration = const Duration(milliseconds: 700),
    this.delay = Duration.zero,
  }) : super(key: key);

  @override
  State<SlideFadeAnimation> createState() => _SlideFadeAnimationState();
}

class _SlideFadeAnimationState extends State<SlideFadeAnimation>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<Offset> _slideAnimation;
  late final Animation<double> _fadeAnimation;

  bool _wasVisible = false;
  bool _canAnimate = true;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(vsync: this, duration: widget.duration);

    final beginOffset = widget.direction == SlideDirection.left
        ? const Offset(-0.3, 0)
        : const Offset(0.3, 0);

    _slideAnimation = Tween<Offset>(begin: beginOffset, end: Offset.zero)
        .animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut));

    _fadeAnimation = Tween<double>(begin: 0, end: 1)
        .animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut));
  }

  void _onVisibilityChanged(VisibilityInfo info) {
    final visible = info.visibleFraction > 0.5;

    if (visible && !_wasVisible && _canAnimate) {
      // Just became visible
      _wasVisible = true;
      _canAnimate = false; // prevent immediate re-trigger

      Future.delayed(widget.delay, () {
        if (mounted) {
          _controller.forward(from: 0);
        }
      });
    } else if (!visible && _wasVisible) {
      // Completely exited, allow animation again
      _wasVisible = false;
      _canAnimate = true;
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return VisibilityDetector(
      key: UniqueKey(),
      onVisibilityChanged: _onVisibilityChanged,
      child: SlideTransition(
        position: _slideAnimation,
        child: FadeTransition(
          opacity: _fadeAnimation,
          child: widget.child,
        ),
      ),
    );
  }
}
