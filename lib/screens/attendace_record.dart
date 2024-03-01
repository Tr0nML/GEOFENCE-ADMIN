import 'package:flutter/material.dart';
import 'package:geofence_attendance_system/themes/text_theme.dart';
import 'package:table_calendar/table_calendar.dart';

import '../constants/colors.dart';

class AttendanceRecord extends StatefulWidget {
  const AttendanceRecord({super.key});

  @override
  State<AttendanceRecord> createState() => _AttendanceRecordState();
}

class _AttendanceRecordState extends State<AttendanceRecord> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back, color: Colors.black),
        ),
        title: Text("Attendance Record", style: AppTextTheme.lightTextTheme.headlineMedium,),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Container(child: TableCalendar(
              focusedDay: DateTime.now(), 
              firstDay: DateTime.utc(2021, 10, 16), 
              lastDay: DateTime.utc(2024, 5, 10),
              daysOfWeekVisible: true,
              calendarStyle: CalendarStyle(rangeHighlightColor: AppColors.colorScheme.primary, markerDecoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: AppColors.colorScheme.primary
                  )),
                  locale: "en_US",
                  headerStyle: HeaderStyle(
                      formatButtonVisible: false, titleCentered: true),
                  availableGestures: AvailableGestures.all,
              )),
          )
        ],
      ),
    );
  }
}