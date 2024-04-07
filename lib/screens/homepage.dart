// import 'package:animated_emoji/animated_emoji.dart';
// import 'package:flutter/cupertino.dart';
// import 'dart:io';

// import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
// import 'package:geofence_attendance_system/common/main_category_accordian.dart';
// import 'package:geofence_attendance_system/common/sub_main_category_accordian.dart';
import 'package:geofence_attendance_system/constants/colors.dart';
import 'package:geofence_attendance_system/constants/dimensions.dart';
// import 'package:geofence_attendance_system/screens/attendace_record.dart';
import 'package:geofence_attendance_system/screens/profile_screen.dart';
import 'package:geofence_attendance_system/screens/show_data.dart';
import 'package:geofence_attendance_system/themes/text_theme.dart';
// import 'package:google_fonts/google_fonts.dart';
import 'package:table_calendar/table_calendar.dart';
// import 'package:syncfusion_flutter_xlsio/xlsio.dart' as excel;
// import 'package:path_provider/path_provider.dart';
// import 'package:intl/intl.dart';



class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  TextEditingController controller=new TextEditingController();

  DateTime today=DateTime.now();
  String showdate="Select a date";

  void _onDaySelected(DateTime day,DateTime focusedDay)
  {
    setState(() {
      today=day;
      String date = today.toString();
      showdate=date.substring(0,10);
    });
  }
  bool isEmpty=true;

  var fromval = "Entry time";
  var toval = "Exit time";
  var offices = ["Choose an Office","Sharda Pai"];
  var chosenOffice = "Choose an Office";

  String date1="";

  String valueChoose="";

  bool displayList1=false;
  bool displayList2=false;
  bool displayList3=false;
  bool displayList=false;
  var entimes=[
    "Entry time",
    "00:00",
    "01:00",
    "02:00",
    "03:00",
    "04:00",
    "05:00",
    "06:00",
    "07:00",
    "08:00",
    "09:00",
    "10:00",
    "11:00",
    "12:00",
    "13:00",
    "14:00",
    "15:00",
    "16:00",
    "17:00",
    "18:00",
    "19:00",
    "20:00",
    "21:00",
    "22:00",
    "23:00",
  ];

  var extimes=[
    "Exit time",
    "00:00",
    "01:00",
    "02:00",
    "03:00",
    "04:00",
    "05:00",
    "06:00",
    "07:00",
    "08:00",
    "09:00",
    "10:00",
    "11:00",
    "12:00",
    "13:00",
    "14:00",
    "15:00",
    "16:00",
    "17:00",
    "18:00",
    "19:00",
    "20:00",
    "21:00",
    "22:00",
    "23:00",
  ];

  // String path1="/attendance record/Manipal University Jaipur/Academic Block 2/2024-04-04/Sharda Pai Auditorium";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        backgroundColor: AppColors.colorScheme.primary,
        child:Material(
          color: AppColors.colorScheme.primary,
          
        child: ListView(
          children: [
            DrawerHeader(child: Center(child: Text("G E O", style: AppTextTheme.lightTextTheme.headlineMedium?.copyWith(color: Colors.white),))),
            GestureDetector(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => const HomePage()));
              },
              child: ListTile(
              title: Text("Home", style: AppTextTheme.lightTextTheme.headlineSmall?.copyWith(color: Colors.white),),
              
              leading: Icon(FeatherIcons.home, color: Colors.white, size: 20,),
              
            )
            ),
            // GestureDetector(
            //   onTap: () {
            //     Navigator.push(context, MaterialPageRoute(builder: (context) => const AttendanceRecord()));
            //   },
            //   child: ListTile(
            //     title: Text("Attendance Record", style: AppTextTheme.lightTextTheme.headlineSmall?.copyWith(color: Colors.white),),
            //     leading: Icon(FeatherIcons.calendar, color: Colors.white, size: 20,),
            //   ),
            // ),
            GestureDetector(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => const ProfileScreen()));
              },
              child: ListTile(
              title: Text("Profile", style: AppTextTheme.lightTextTheme.headlineSmall?.copyWith(color: Colors.white),),
              leading: Icon(FeatherIcons.user, color: Colors.white, size: 20,),
            ),
            ),
            // ListTile(
            //   title: Text("Version 1.0", style: AppTextTheme.lightTextTheme.headlineSmall?.copyWith(color: Colors.white),),
            // )
          ],
        )
        ),
      ),
      appBar: AppBar(
        backgroundColor: AppColors.colorScheme.onPrimary,
        centerTitle: false,
        
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Manipal University Jaipur", style: AppTextTheme.lightTextTheme.headlineSmall,),
            Text("Your organization", style: AppTextTheme.lightTextTheme.bodyLarge,)
          ],
        ),
      ),
      // body: SafeArea(child: SingleChildScrollView(
      //   child: Column(
      //     crossAxisAlignment: CrossAxisAlignment.start,
      //     children: [
        
      //       // SizedBox(height: ScreenDimensions.getScreenHeight(context) * 0.01,),
        
      //       Container(
      //         width: double.infinity,
      //         height: ScreenDimensions.getScreenHeight(context) * 0.003,
      //         color: Colors.black,
      //       ),

      //       SizedBox(height: ScreenDimensions.getScreenHeight(context) * 0.01,),

      //       Padding(
      //         padding: const EdgeInsets.symmetric(horizontal: 20),
      //         child: Text("Hi, Teacher", style: AppTextTheme.lightTextTheme.displayMedium!.copyWith(fontSize: 24, fontWeight: FontWeight.w600),),
      //       ),

      //       SizedBox(height: ScreenDimensions.getScreenHeight(context) * 0.01,),

      //       Padding(padding: EdgeInsets.symmetric(horizontal: 20), child: Row(
      //         children: [
      //           Text("Manage Geofences ", style: AppTextTheme.lightTextTheme.bodyMedium?.copyWith(fontWeight: FontWeight.w800, fontSize: 20),),
      //           SizedBox(width: ScreenDimensions.getScreenWidth(context) * 0.01,),
      //           const AnimatedEmoji(AnimatedEmojis.globeShowingEuropeAfrica, size: 30,)
      //         ],
      //       )),

      //       SizedBox(height: ScreenDimensions.getScreenHeight(context) * 0.02,),

      //       const MainCategoryAccordian(title: "Academic Block 1", subtitle: "FoE, FoM", imagePath: "assets/images/muj-ab1.jpeg", subCategory1: SubMainCategoryAccordian(title: "1st Floor",), subCategory2: SubMainCategoryAccordian(title: "2nd Floor"), subCategory3: SubMainCategoryAccordian(title: "3rd Floor"),),

      //       SizedBox(height: ScreenDimensions.getScreenHeight(context) * 0.01,),

      //       const MainCategoryAccordian(title: 'Academic Block 2', subtitle: "FoE, FoS", imagePath: "assets/images/muj-ab2.jpeg", subCategory1: SubMainCategoryAccordian(title: "1st Floor",), subCategory2: SubMainCategoryAccordian(title: "2nd Floor"), subCategory3: SubMainCategoryAccordian(title: "3rd Floor"), subCategory4: SubMainCategoryAccordian(title: "Auditorium", subCategory1: SubMainCategoryAccordian(title: "Sharda Pai Auditorium"), subCategory2: SubMainCategoryAccordian(title: "TMA Pai Auditorium"),),),

      //       // SizedBox(height: ScreenDimensions.getScreenHeight(context) * 0.02,),

      //       // const MainCategoryAccordian(title: 'Academic Block 2', subtitle: "FoE, FoS", imagePath: "assets/images/muj-ab2.jpeg", subCategory1: SubMainCategoryAccordian(title: "1st Floor",), subCategory2: SubMainCategoryAccordian(title: "2nd Floor"), subCategory3: SubMainCategoryAccordian(title: "3rd Floor"), subCategory4: SubMainCategoryAccordian(title: "Auditorium", subCategory1: SubMainCategoryAccordian(title: "Sharda Pai Auditorium"),),)
      //     ],
      //   ),
      // )),
      body: SafeArea(child: SingleChildScrollView(
        
        child: Column(
          
          crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
              width: double.infinity,
              height: ScreenDimensions.getScreenHeight(context) * 0.002,
              color: Colors.black,
            ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Container(child: TableCalendar(
              
              focusedDay: today, 
              firstDay: DateTime.utc(2023, 1, 1), 
              lastDay: DateTime.utc(2025, 5, 31),
              daysOfWeekVisible: true,
              calendarStyle: CalendarStyle(
                rangeHighlightColor:  Color.fromARGB(255, 227, 162, 59), 
                
                defaultTextStyle:TextStyle(color: Color.fromARGB(255, 0, 0, 0)),

                weekendTextStyle:TextStyle(color: Color.fromARGB(255, 203, 14, 0)),
              ),
                  locale: "en_US",
                  rowHeight: 40,
                  headerStyle: HeaderStyle(
                      formatButtonVisible: false, titleCentered: true),
                  availableGestures: AvailableGestures.all,
                  selectedDayPredicate: (day) => isSameDay(day, today),
                  
                  onDaySelected: _onDaySelected,
                  
              )),
          ),
          SizedBox(height: ScreenDimensions.getScreenHeight(context) * 0.04,),
          Container(
              width: double.infinity,
              height: ScreenDimensions.getScreenHeight(context) * 0.002,
              color: Colors.black,
            ),
            SizedBox(height: ScreenDimensions.getScreenHeight(context) * 0.015,),
            Center(
              
                child: Row(
                  
                  // mainAxisAlignment: MainAxisAlignment.center,
                  // children: [
                    
                  //   Column (
                  //     children: [
                  //       Text ("Entry Time"), inputField(),
                  //       displayList1 ? selectionField1() : SizedBox()
                  //     ],
                  //   ),
                  //   SizedBox(
                  //     width: 10,
                  //   ),
                  //   Column (
                  //     children: [
                  //       Text ("Exit Time"), inputField(),
                  //       displayList2 ? selectionField2() : SizedBox()
                  //     ],
                  //   ),
                  //   SizedBox(
                  //     width: 10,
                  //   ),
                  //   Column (
                  //     children: [
                  //       Text ("Office Name"), inputField(),
                  //       displayList3 ? selectionField3() : SizedBox()
                  //     ],
                  //   ), 
                      
                  // ],
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        DropdownButton(
                            value: fromval.isNotEmpty?fromval:null,
                            items: entimes.map((String items) {
                              return DropdownMenuItem(
                                value: items,
                                child: Text(style: AppTextTheme.lightTextTheme.headlineLarge,
                                  items
                                  ),
                              );
                            }).toList(),
                            onChanged: (String? newval) {
                              setState(() {
                                fromval = newval!;
                
                              });
                            }),
                        SizedBox(
                          width: 10,
                        ),
                        DropdownButton(
                            value: toval.isNotEmpty?toval:null,
                            items: extimes.map((String items) {
                              return DropdownMenuItem(
                                value: items,
                                child: Text(items),
                              );
                            }).toList(),
                            onChanged: (String? newval) {
                              setState(() {
                                toval = newval!;
                
                              });
                            }),
                            SizedBox(
                          width: 10,
                        ),
                        DropdownButton(
                            value: chosenOffice.isNotEmpty? chosenOffice:null,
                            items: offices.map((String items) {
                              return DropdownMenuItem(
                                value: items,
                                child: Text(items),
                              );
                            }).toList(),
                            onChanged: (String? newval) {
                              setState(() {
                                chosenOffice = newval!;
                
                              });
                            }),
                      ]
                ),
              ),
            
            SizedBox(height: ScreenDimensions.getScreenHeight(context) * 0.015,),
            Container(
              width: double.infinity,
              height: ScreenDimensions.getScreenHeight(context) * 0.002,
              color: Colors.black,
            ),
            SizedBox(height: ScreenDimensions.getScreenHeight(context) * 0.01,),
            Card(
              elevation: 5,
              shape: OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
              color: AppColors.colorScheme.secondary,
              shadowColor: AppColors.colorScheme.primary,
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.only(
                     top: 50,
                    bottom: 50,
                  ),
                  
                  child: Padding(
                    padding: const EdgeInsets.only(left: 8.0,right: 8,),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      
                      children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(2.0),
                                  child: Text(
                                    "Date : ${showdate}",
                                    style: AppTextTheme.lightTextTheme.headlineSmall,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(2.0),
                                  child: Text(
                                    "Classroom : ${chosenOffice}",
                                    style: AppTextTheme.lightTextTheme.headlineSmall,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(2.0),
                                  child: Text(
                                    "Start time : ${fromval} ",
                                    style: AppTextTheme.lightTextTheme.headlineSmall,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(2.0),
                                  child: Text(
                                    "",
                                    style: AppTextTheme.lightTextTheme.headlineSmall,
                                  ),
                                ),
                          
                              ],
                            
                          ),
                        
                        GestureDetector( 
                          child: Icon(
                            Icons.download,
                           size: 40,
                          opticalSize: 10,
                          grade: 20,
                          ),
                          onTap: () {
                            setState(() {

                              Navigator.push(context, MaterialPageRoute(builder: (context) => const ShowData()));
                            });
                          },
                        ),
                        
                      ],
                    ),
                  ),
                ),
              ),
            ),
            // DropdownButton(
            //   value: valueChoose, 
            //   onChanged: (newValue){
            //     setState(() {
            //       valueChoose=newValue.toString();
            //     });
            //   },
            //   hint:Text("Entry time"), 
            //   items: times.map((valueItem){
            //     return DropdownMenuItem(
            //       value: valueItem,
            //       child: Text(valueItem)
            //       );
            //   }).toList(),
            // ),
            
        ],
      ),
      
    )
    )
    );
  }

  // Widget inputField () {
  //     return Container(
  //       width: 120, 
  //       height: 50,
  //       decoration: BoxDecoration (
  //           border: Border.all (color: Colors.grey),
  //           color:Colors.white,
  //           borderRadius: BorderRadius.circular(6)
  //           ), 
  //       child: TextField(
  //         controller: controller, 
  //         decoration: InputDecoration( 
  //           border: InputBorder.none, 
  //           suffixIcon: GestureDetector(
  //             onTap: () {
  //             setState(() {
  //               displayList = !displayList;
  //             });
  //             },
  //             child: Icon(Icons.arrow_drop_down),
  //           ),
  //         ),
  //       ),
  //     ); 
  // }

  // Widget selectionField1() {
  //   return Container(
  //     height: 200, 
  //     width: 130, 
  //     decoration: BoxDecoration(
  //       borderRadius: BorderRadius.circular(9), 
  //       color: Colors.white,
  //       boxShadow: [
  //         BoxShadow(
  //           color: Colors.grey.withOpacity(0.3), 
  //           spreadRadius: 1, 
  //           blurRadius: 3, 
  //           offset: Offset(0, 1),
  //         ),
  //       ]),
  //     child: ListView. builder(
  //       itemCount: times.length,
  //       itemBuilder: ((context, index) {
  //         return GestureDetector(
  //           onTap: () {
  //             setState (() {
  //               controller.text = (index + 1). toString();
  //             }) ;
  //           },
  //           child: ListTile(
  //             title: Text(times[index]),
  //           ),
  //         );
  //       })
  //     ),
  //   );
  // }

  // Widget selectionField2() {
  //   return Container(
  //     height: 200, 
  //     width: 130, 
  //     decoration: BoxDecoration(
  //       borderRadius: BorderRadius.circular(9), 
  //       color: Colors.white,
  //       boxShadow: [
  //         BoxShadow(
  //           color: Colors.grey.withOpacity(0.3), 
  //           spreadRadius: 1, 
  //           blurRadius: 3, 
  //           offset: Offset(0, 1),
  //         ),
  //       ]),
  //     child: ListView. builder(
  //       itemCount: times.length,
  //       itemBuilder: ((context, index) {
  //         return GestureDetector(
  //           onTap: () {
  //             setState (() {
  //               controller.text = (index + 1). toString();
  //             }) ;
  //           },
  //           child: ListTile(
  //             title: Text(times[index]),
  //           ),
  //         );
  //       })
  //     ),
  //   );
  // }

  // Widget selectionField3() {
  //   return Container(
  //     height: 200, 
  //     width: 130, 
  //     decoration: BoxDecoration(
  //       borderRadius: BorderRadius.circular(9), 
  //       color: Colors.white,
  //       boxShadow: [
  //         BoxShadow(
  //           color: Colors.grey.withOpacity(0.3), 
  //           spreadRadius: 1, 
  //           blurRadius: 3, 
  //           offset: Offset(0, 1),
  //         ),
  //       ]),
  //     child: ListView. builder(
  //       itemCount: times.length,
  //       itemBuilder: ((context, index) {
  //         return GestureDetector(
  //           onTap: () {
  //             setState (() {
  //               controller.text = (index + 1). toString();
  //             }) ;
  //           },
  //           child: ListTile(
  //             title: Text(times[index]),
  //           ),
  //         );
  //       })
  //     ),
  //   );
  // }

   

}
