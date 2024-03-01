import 'package:flutter/material.dart';
import 'package:geofence_attendance_system/themes/text_theme.dart';

class SubMainCategoryAccordian extends StatelessWidget {
  final String title; final Widget subCategory1; final Widget subCategory2;
  const SubMainCategoryAccordian({super.key, required this.title, this.subCategory1 = const SizedBox(), this.subCategory2 = const SizedBox() });

  @override
  Widget build(BuildContext context) {
    return ListTileTheme(
      contentPadding: EdgeInsets.all(0),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: ExpansionTile(
          title: Text(title, style: AppTextTheme.lightTextTheme.bodyLarge?.copyWith(color: Colors.white, fontWeight: FontWeight.w800),),
          children: [
            subCategory1,
            subCategory2,
          ],
          ),
      ),
    );
  }
}