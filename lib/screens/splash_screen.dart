import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test/screens/splash_screen_controller.dart';
import 'package:test/utils/assets.dart';
import 'package:test/utils/common_background_gradient.dart';
import 'package:test/utils/extensions.dart';

class SplashScreen extends StatefulWidget {
  SplashScreen({super.key});
  final controller = Get.put(SplashScreenController());

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late final AnimationController animationController;
  late final Animation<double> sizeAnimation;
  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1100),
    )..repeat(reverse: true);

    sizeAnimation =
        Tween<double>(begin: 100, end: 400).animate(animationController);
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Image.asset(
          Assets.niyoLogo,
          errorBuilder: (_, __, ___) => const SizedBox.shrink(),
        ),
        title: Text(
          "NiyoX",
          style: Theme.of(context).textTheme.titleLarge?.copyWith(
                fontSize: 38,
              ),
        ),
        flexibleSpace: const CommonBackgroundGradient(),
      ),
      body: CommonBackgroundGradient(
        child: AnimatedBuilder(
          animation: animationController,
          builder: (_, __) => Center(
            child: Image.asset(
              Assets.niyoImg,
              width: sizeAnimation.value,
              height: sizeAnimation.value,
            ),
          ),
        ).padSymmetric(value: 20),
      ),
    );
  }
}
