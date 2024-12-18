import 'package:flutter/material.dart';

import 'package:flutter_payment/core/utils/extensions/spaces.dart';
import 'package:flutter_payment/presentation/checkout/views/checkout_view.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'dot_circle.dart';

class DotsSection extends StatefulWidget {
  const DotsSection({super.key});

  @override
  State<DotsSection> createState() => _DotsSectionState();
}

class _DotsSectionState extends State<DotsSection>
    with TickerProviderStateMixin {
  late AnimationController _animationController;

  late Animation<Offset> _firstCircleAnimation;
  late Animation<Offset> _secondCircleAnimation;
  late Animation<Offset> _thirdCircleAnimation;

  static const Duration animationDuration = Duration(milliseconds: 700);
  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: animationDuration,
    );

    _firstCircleAnimation = Tween<Offset>(
      begin: const Offset(0, 1.5),
      end: const Offset(0, 0),
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: const Interval(0, 0.5, curve: Curves.easeInOut),
    ));

    _secondCircleAnimation = Tween<Offset>(
      begin: const Offset(0, 1.5),
      end: const Offset(0, 0),
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: const Interval(0.5, 0.7, curve: Curves.easeInOut),
    ));

    _thirdCircleAnimation = Tween<Offset>(
      begin: const Offset(0, 1.5),
      end: const Offset(0, 0),
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: const Interval(0.7, 1.0, curve: Curves.easeInOut),
    ));

    _animationController.repeat(reverse: true);
    navigateToNextScreen();
  }

  Future<void> navigateToNextScreen() async {
    await Future.delayed(
      const Duration(seconds: 3),
    ).then((value) {
      if (mounted) {
        Navigator.of(context).pushReplacementNamed(CheckoutView.routeName);
      }
    });
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SlideTransition(
          position: _firstCircleAnimation,
          child: DotCircle(color: Colors.white.withOpacity(0.6)),
        ),
        10.w.hSpace,
        SlideTransition(
            position: _secondCircleAnimation,
            child: const DotCircle(color: Colors.white)),
        10.w.hSpace,
        SlideTransition(
            position: _thirdCircleAnimation,
            child: DotCircle(color: Colors.white.withOpacity(0.6)))
      ],
    );
  }
}
