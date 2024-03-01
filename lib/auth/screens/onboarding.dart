import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:geofence_attendance_system/auth/screens/login.dart';
import 'package:geofence_attendance_system/auth/screens/register.dart';
import 'package:geofence_attendance_system/constants/colors.dart';
import 'package:geofence_attendance_system/themes/text_theme.dart';
import '../../common/custom_button.dart';
import '../../constants/dimensions.dart';

class OnBoarding extends StatelessWidget {
  const OnBoarding({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.colorScheme.primary,
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset('assets/illustrations/onBoarding.svg', width: ScreenDimensions.getScreenWidth(context) * 0.4, height: ScreenDimensions.getScreenHeight(context) * 0.4,),
            
                SizedBox(height: ScreenDimensions.getScreenHeight(context) * 0.03),
            
                Text("NAVIGATE ATTENDANCE WITH PRECISION", style: AppTextTheme.lightTextTheme.displayMedium, textAlign: TextAlign.center,),
            
                SizedBox(height: ScreenDimensions.getScreenHeight(context) * 0.03),
            
                Text("We're excited to introduce you to our innovative solution that revolutionizes how you track attendance. With our Geofence Attendance System, you can effortlessly monitor and manage attendance within predefined geographical boundaries.", style: AppTextTheme.lightTextTheme.bodyLarge, textAlign: TextAlign.center,),

                SizedBox(height: ScreenDimensions.getScreenHeight(context) * 0.05,),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomButton(title: 'Sign Up', outerContainerColor: AppColors.colorScheme.surface, borderColor: AppColors.colorScheme.surface, containerColor: AppColors.colorScheme.primary, textColor: AppColors.colorScheme.surface, onTap: () { Navigator.push(context, MaterialPageRoute(builder: (context) => const Register())); },),
                
                    SizedBox(width: ScreenDimensions.getScreenWidth(context) * 0.05,),
                
                    CustomButton(title: 'Log In', borderColor: Colors.black, containerColor: AppColors.colorScheme.primary, outerContainerColor: Colors.black, textColor: Colors.black, onTap: () { Navigator.push(context, MaterialPageRoute(builder: (context) => const Login())); }, )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}