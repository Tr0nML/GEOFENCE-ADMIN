import 'package:flutter/material.dart';
import '../constants/dimensions.dart';
import '../themes/text_theme.dart';


class CustomButton extends StatelessWidget {
  final String title; final void Function() onTap;
  final Color outerContainerColor; final Color borderColor; final Color textColor;
  final Color containerColor;
  const CustomButton({super.key, required this.title, required this.borderColor, required this.containerColor, required this.outerContainerColor, required this.textColor, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      // ignore: avoid_unnecessary_containers
      child: Container(
        child: Stack(
          alignment: Alignment.topCenter,
          children: [
            Positioned(
              child: Container(
                height: ScreenDimensions.getScreenHeight(context) * 0.055,
                width: ScreenDimensions.getScreenWidth(context) * 0.4,
                decoration: BoxDecoration(
                  color: outerContainerColor,
                  borderRadius: const BorderRadius.all(Radius.circular(12)),
                ),
              ),
            ),
            Positioned(
              child: Container(
                height: ScreenDimensions.getScreenHeight(context) * 0.05,
                width: ScreenDimensions.getScreenWidth(context) * 0.4,
                decoration: BoxDecoration(
                  color: containerColor,
                  borderRadius: const BorderRadius.all(Radius.circular(12)),
                  border: Border.all(color: borderColor, width: 2)
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(title, style: AppTextTheme.lightTextTheme.bodyLarge!.copyWith(color: textColor, fontWeight: FontWeight.w700), textAlign: TextAlign.center,),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}