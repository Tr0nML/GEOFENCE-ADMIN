import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutter_svg/svg.dart';
import 'package:geofence_attendance_system/auth/screens/register.dart';
import 'package:geofence_attendance_system/constants/colors.dart';
import '../../common/custom_button.dart';
import '../../common/custom_text_box.dart';
import '../../constants/dimensions.dart';
import '../../themes/text_theme.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.colorScheme.secondary,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SvgPicture.asset('assets/illustrations/muj.svg', height: ScreenDimensions.getScreenHeight(context) * 0.15,),
          
                  const SizedBox(height: 16,),
          
                  Text("Good to see you again !", style: AppTextTheme.lightTextTheme.displayMedium,),
          
                  const SizedBox(height: 16,),
          
                  Text("Rejoin the virtual experience of marking your attendance effortlessly!", style: AppTextTheme.lightTextTheme.bodyLarge?.copyWith(fontWeight: FontWeight.w500),),
          
                  const SizedBox(height: 20,),
          
                  const CustomTextBox(label: "Email", icon: Icon(FeatherIcons.mail)),
          
                  const SizedBox(height: 16,),
          
                  const CustomTextBox(label: "Password", icon: Icon(FeatherIcons.lock)),
          
                  SizedBox(height: ScreenDimensions.getScreenHeight(context) * 0.175,),
          
                  Center(child: CustomButton(title: "Log In", borderColor: Colors.black, containerColor: AppColors.colorScheme.primary, outerContainerColor: AppColors.colorScheme.secondary, textColor: AppColors.colorScheme.secondary, onTap: () => {})),
          
          
                  SizedBox(height: ScreenDimensions.getScreenHeight(context) * 0.1,),
          
                  Row(
                    
                    mainAxisAlignment: MainAxisAlignment.center,
          
                    children: [
          
                    Text("New Here? ", style: AppTextTheme.lightTextTheme.bodyMedium!.copyWith(fontWeight: FontWeight.w500),),
          
                    GestureDetector(
                      onTap: () { Navigator.push(context, (MaterialPageRoute(builder: (context) => const Register()))); },
                      child: Text("Sign Up Here", style: AppTextTheme.lightTextTheme.bodyMedium!.copyWith(color: AppColors.colorScheme.primary, fontWeight: FontWeight.w500,decoration: TextDecoration.underline), ))
          
                  ],)
          
                ],
              ),
            ),
          ),
        )
        ),
    );
  }
}