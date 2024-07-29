import 'dart:math';

import 'package:flutter/material.dart';

import '../../../constants/const_colors.dart';
import '../../../constants/const_drawables.dart';
import '../controllers/splash_controller.dart';

class SplashScreen extends StatefulWidget {
  final SplashController controller;
  const SplashScreen({
    super.key,
    required this.controller,
  });

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  SplashController get _controller => widget.controller;
  late AnimationController _animationController;
  late Animation<double> _animation;

  void checkAuth() {
    _controller.verificationAuth(
      onSuccess: () {
        // Modular.to.navigate(ConstPages.home);
      },
      onError: () {
        // Scaffold.of(context).showSnackBar(
        //   SnackBar(
        //     content: Text(error.toString()),
        //   ),
        // );
        // Modular.to.navigate(ConstPages.login);
      },
    );
  }

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )..forward();

    _animation = Tween<double>(begin: 0, end: 2 * pi).animate(
      _animationController,
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => AnimatedBuilder(
        animation: _animationController,
        builder: (_, __) => ColoredBox(
          color:  const Color(ConstColors.blueLight),
          child: Center(
            child: Transform(
              alignment: Alignment.center,
              transform: Matrix4.identity()..rotateY(_animation.value),
              child: AnimatedOpacity(
                duration: _animationController.duration!,
                opacity: 1,
                child: Image.asset(
                  ConstDrawables.logo,
                  width: MediaQuery.sizeOf(context).width * _animation.value,
                ),
              ),
            ),
          ),
        ),
      );
}
