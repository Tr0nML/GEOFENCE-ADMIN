import 'package:animated_emoji/animated_emoji.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:geofence_attendance_system/common/main_category_accordian.dart';
import 'package:geofence_attendance_system/common/sub_main_category_accordian.dart';
import 'package:geofence_attendance_system/constants/colors.dart';
import 'package:geofence_attendance_system/constants/dimensions.dart';
import 'package:geofence_attendance_system/screens/attendace_record.dart';
import 'package:geofence_attendance_system/themes/text_theme.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.colorScheme.onPrimary,
        centerTitle: true,
        automaticallyImplyLeading: false,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text("Manipal University Jaipur", style: AppTextTheme.lightTextTheme.headlineSmall,),
            Text("Your organization", style: AppTextTheme.lightTextTheme.bodyLarge,)
          ],
        ),
      ),
      body: SafeArea(child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
        
            // SizedBox(height: ScreenDimensions.getScreenHeight(context) * 0.01,),
        
            Container(
              width: double.infinity,
              height: ScreenDimensions.getScreenHeight(context) * 0.003,
              color: Colors.black,
            ),

            SizedBox(height: ScreenDimensions.getScreenHeight(context) * 0.05,),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Text("Hi, Teacher", style: AppTextTheme.lightTextTheme.displayMedium!.copyWith(fontSize: 24, fontWeight: FontWeight.w600),),
            ),

            SizedBox(height: ScreenDimensions.getScreenHeight(context) * 0.01,),

            Padding(padding: EdgeInsets.symmetric(horizontal: 20), child: Row(
              children: [
                Text("Manage Geofences ", style: AppTextTheme.lightTextTheme.bodyMedium?.copyWith(fontWeight: FontWeight.w800, fontSize: 20),),
                SizedBox(width: ScreenDimensions.getScreenWidth(context) * 0.01,),
                const AnimatedEmoji(AnimatedEmojis.globeShowingEuropeAfrica, size: 50,)
              ],
            )),

            SizedBox(height: ScreenDimensions.getScreenHeight(context) * 0.02,),

            const MainCategoryAccordian(title: "Academic Block 1", subtitle: "FoE, FoM", imagePath: "assets/images/muj-ab1.jpeg", subCategory1: SubMainCategoryAccordian(title: "1st Floor",), subCategory2: SubMainCategoryAccordian(title: "2nd Floor"), subCategory3: SubMainCategoryAccordian(title: "3rd Floor"),),

            SizedBox(height: ScreenDimensions.getScreenHeight(context) * 0.01,),

            const MainCategoryAccordian(title: 'Academic Block 2', subtitle: "FoE, FoS", imagePath: "assets/images/muj-ab2.jpeg", subCategory1: SubMainCategoryAccordian(title: "1st Floor",), subCategory2: SubMainCategoryAccordian(title: "2nd Floor"), subCategory3: SubMainCategoryAccordian(title: "3rd Floor"), subCategory4: SubMainCategoryAccordian(title: "Auditorium", subCategory1: SubMainCategoryAccordian(title: "Sharda Pai Auditorium"), subCategory2: SubMainCategoryAccordian(title: "TMA Pai Auditorium"),),),

            // SizedBox(height: ScreenDimensions.getScreenHeight(context) * 0.02,),

            // const MainCategoryAccordian(title: 'Academic Block 2', subtitle: "FoE, FoS", imagePath: "assets/images/muj-ab2.jpeg", subCategory1: SubMainCategoryAccordian(title: "1st Floor",), subCategory2: SubMainCategoryAccordian(title: "2nd Floor"), subCategory3: SubMainCategoryAccordian(title: "3rd Floor"), subCategory4: SubMainCategoryAccordian(title: "Auditorium", subCategory1: SubMainCategoryAccordian(title: "Sharda Pai Auditorium"),),)
          ],
        ),
      )),
      endDrawer: Drawer(
        backgroundColor: AppColors.colorScheme.primary,
        child: ListView(
          children: [
            DrawerHeader(child: Center(child: Text("G E O", style: AppTextTheme.lightTextTheme.headlineMedium?.copyWith(color: Colors.white),))),
            ListTile(
              title: Text("Home", style: AppTextTheme.lightTextTheme.headlineSmall?.copyWith(color: Colors.white),),
              leading: Icon(FeatherIcons.home, color: Colors.white, size: 20,),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => const AttendanceRecord()));
              },
              child: ListTile(
                title: Text("Attendance Record", style: AppTextTheme.lightTextTheme.headlineSmall?.copyWith(color: Colors.white),),
                leading: Icon(FeatherIcons.calendar, color: Colors.white, size: 20,),
              ),
            ),
            ListTile(
              title: Text("Profile", style: AppTextTheme.lightTextTheme.headlineSmall?.copyWith(color: Colors.white),),
              leading: Icon(FeatherIcons.user, color: Colors.white, size: 20,),
            ),
            ListTile(
              title: Text("Version 0.0", style: AppTextTheme.lightTextTheme.headlineSmall?.copyWith(color: Colors.white),),
            )
          ],
        ),
      ),
    );
  }
}