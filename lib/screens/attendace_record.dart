import 'package:flutter/material.dart';
import 'package:geofence_attendance_system/themes/text_theme.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:geofence_attendance_system/constants/dimensions.dart';
import '../constants/colors.dart';
import 'package:geofence_attendance_system/screens/homepage.dart';
class AttendanceRecord extends StatefulWidget {
  const AttendanceRecord({super.key});

  @override
  State<AttendanceRecord> createState() => _AttendanceRecordState();
}

class _AttendanceRecordState extends State<AttendanceRecord> {

  DateTime today=DateTime.now();
  void _onDaySelected(DateTime day,DateTime focusedDay)
  {
    setState(() {
      today=day;
    });
  }
  // String valueChoose;
  // List times=[
  //   "Choose a time",
  //   "00:00",
  //   "01:00",
  //   "02:00",
  //   "03:00",
  //   "04:00",
  //   "05:00",
  //   "06:00",
  //   "07:00",
  //   "08:00",
  //   "09:00",
  //   "10:00",
  //   "11:00",
  //   "12:00",
  //   "13:00",
  //   "14:00",
  //   "15:00",
  //   "16:00",
  //   "17:00",
  //   "18:00",
  //   "19:00",
  //   "20:00",
  //   "21:00",
  //   "22:00",
  //   "23:00",
  // ];


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
        title: Text("Attendance Record", style: AppTextTheme.lightTextTheme.headlineMedium,),
        centerTitle: true,
      ),
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
          SizedBox(height: ScreenDimensions.getScreenHeight(context) * 0.02,),
          Container(
              width: double.infinity,
              height: ScreenDimensions.getScreenHeight(context) * 0.002,
              color: Colors.black,
            ),
            SizedBox(height: ScreenDimensions.getScreenHeight(context) * 0.02,),
            
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
}