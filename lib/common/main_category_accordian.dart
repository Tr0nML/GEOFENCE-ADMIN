import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';

import '../constants/colors.dart';
import '../constants/dimensions.dart';
import '../themes/text_theme.dart';

class MainCategoryAccordian extends StatelessWidget {
  final String title; final String subtitle; final String imagePath; final Widget subCategory1; final Widget subCategory2; final Widget subCategory3; final Widget subCategory4;
  const MainCategoryAccordian({super.key, required this.title, required this.subtitle, required this.imagePath, required this.subCategory1, required this.subCategory2, required this.subCategory3, this.subCategory4 = const SizedBox()});

  @override
  Widget build(BuildContext context) {
    return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: ListTileTheme(
                contentPadding: EdgeInsets.all(0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: ExpansionTile(
                    title: Container(
                      width: ScreenDimensions.getScreenWidth(context),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 20),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Text(title, style: AppTextTheme.lightTextTheme.headlineMedium?.copyWith(color: Colors.white),),
                                    SizedBox(width: 6,),
                                    Icon(FeatherIcons.chevronDown, color: Colors.white,)
                                  ],
                                ),
                                Text(subtitle, style: AppTextTheme.lightTextTheme.headlineSmall?.copyWith(color: Colors.white),)
                              ],
                            ),
                          ),
                          
                          ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: Image.asset(imagePath, height: 80, width: 80, fit: BoxFit.cover,))
                        ],
                      )),
                    collapsedBackgroundColor: AppColors.colorScheme.primary,
                    backgroundColor: AppColors.colorScheme.primary,
                    trailing: const SizedBox(),
                    children: [
                      subCategory1,
                      subCategory2,
                      subCategory3,
                      subCategory4,
                    ],
                    ),
                ),
              ),
            );
  }
}