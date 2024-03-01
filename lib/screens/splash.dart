import 'dart:async';
import 'package:flutter/material.dart';
import 'package:geofence_attendance_system/constants/colors.dart';
import 'package:iconsax/iconsax.dart';
import '../auth/screens/onboarding.dart';
import '../constants/dimensions.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> with SingleTickerProviderStateMixin {

  late AnimationController controller;
  late Animation<double> scaleAnimation;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller = AnimationController(vsync: this, duration: const Duration(milliseconds: 500));
    scaleAnimation = Tween<double>(begin: 1, end: 10).animate(controller);

    Timer(const Duration(seconds: 1) ,() {
      controller.forward();
    });
    
    Timer(const Duration(seconds: 2), () {
      Navigator.of(context).push(MaterialPageRoute(builder: ((context) => const OnBoarding())));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ScaleTransition(
          scale: scaleAnimation,
          child: Container(
            height: ScreenDimensions.getScreenHeight(context) * 0.3,
            width: ScreenDimensions.getScreenWidth(context) * 0.3,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: AppColors.colorScheme.primary
            ),
            child: Transform.scale(
              scale: 1/10,
              child: Icon(Iconsax.location, size: ScreenDimensions.getScreenHeight(context) * 0.05,  color: AppColors.colorScheme.secondary,)),
          ),
        ),
      ),
    );
  }
}