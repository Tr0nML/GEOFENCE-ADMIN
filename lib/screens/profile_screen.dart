import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:geofence_attendance_system/constants/colors.dart';
// import 'package:geofence_attendance_system/constants/dimensions.dart';
import 'package:geofence_attendance_system/themes/text_theme.dart';
import 'package:geofence_attendance_system/screens/homepage.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.colorScheme.onPrimary,
        leading: IconButton(
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => const HomePage()));
          },
          icon: const Icon(Icons.arrow_back, color: Colors.black),
        ),
        title: Text("Profile", style: AppTextTheme.lightTextTheme.headlineMedium,),
        centerTitle: true,
        
      ),
      body: SafeArea(child: SingleChildScrollView(
        padding: const EdgeInsets.only(
          left: 20,
          right: 20,
          bottom: 20,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,

          children: [
            //  Container(
            //   width: double.infinity,
            //   height: ScreenDimensions.getScreenHeight(context) * 0.002,
            //   color: Colors.black,
            // ),
           
            const SizedBox(height: 40),
            Center(
              child: CircleAvatar(
                backgroundColor: Colors.black,
                radius: 70,
                backgroundImage: AssetImage('assets/images/pp.jpeg'),
              ),
            ),
            const SizedBox(height: 20),
            itemProfile('Name', 'Aryan Garg', CupertinoIcons.person),
            const SizedBox(height: 10),
            itemProfile('Phone', '9045180454', CupertinoIcons.phone),
            const SizedBox(height: 10),
            itemProfile('College', 'Manipal University Jaipur', CupertinoIcons.location),
            const SizedBox(height: 10),
            itemProfile('Email', 'aryan.garg@jaipur.manipal.edu', CupertinoIcons.mail),
            const SizedBox(height: 20,),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white,
                    backgroundColor: Color.fromARGB(255, 255, 141, 20),
                    elevation: 20,
                    padding: const EdgeInsets.all(15),
                  ),
                  child: const Text('Edit Profile')
              ),
            )
          ],
        ),
        
      ),
    )
    );
  }

  itemProfile(String title, String subtitle, IconData iconData) {
    return Container(
      decoration: BoxDecoration(
          color: AppColors.colorScheme.secondary,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
                offset: Offset(0, 5),
                color: Colors.deepOrange.withOpacity(.2),
                spreadRadius: 2,
                blurRadius: 10
            )
          ]
      ),
      child: ListTile(
        title: Text(title),
        subtitle: Text(subtitle),
        leading: Icon(iconData),
        
        tileColor: Colors.white,
      ),
    );
  }
}