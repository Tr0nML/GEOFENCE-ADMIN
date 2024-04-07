import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_xlsio/xlsio.dart' as excel;
import 'package:path_provider/path_provider.dart';

final db = FirebaseFirestore.instance;

class ShowData extends StatefulWidget {
  const ShowData({super.key});

  @override
  State<ShowData> createState() => _ShowDataState();
}

class _ShowDataState extends State<ShowData> {

  @override

  
  
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Attendance "),
        centerTitle: true,
        ),
        body: StreamBuilder(
          stream: db.collection("/attendance record/Manipal University Jaipur/Academic Block 2/2024-04-04/Sharda Pai Auditorium").snapshots(),
          builder: (context,snapshot){
            if(snapshot.connectionState==ConnectionState.active){
              if(snapshot.hasData){
                return ListView.builder(itemBuilder: (context,index){
                  
                  return ListTile(
                    leading: CircleAvatar(
                      child: Text("${index+1}"),
                    ),
                    title: Text("${snapshot.data!.docs[index]["name"]}"),
                    subtitle: Text("${snapshot.data!.docs[index]["inTime"]}"+" to "+"${snapshot.data!.docs[index]["outTime"]}"),
                  );
                },
                itemCount: snapshot.data!.docs.length,
                );
              }
              else if(snapshot.hasError){
                return Center(child: Text("${snapshot.hasError.toString()}"),);
              }
              else{
                return Center(child: Text("No data found"),);
              }
            }
            else{
              return Center(child: CircularProgressIndicator(),);
            }
          },
          
          ),
    );
  }

  Future<void> exportDataToExcel(List<Map<String, dynamic>> data) async {
    final excel.Workbook workbook = excel.Workbook();
    final excel.Worksheet sheet = workbook.worksheets[0];

    sheet.getRangeByIndex(1, 1).setText("Duartion");
    sheet.getRangeByIndex(1, 2).setText("Entry Time");
    sheet.getRangeByIndex(1, 3).setText("Exit Time");
    sheet.getRangeByIndex(1, 4).setText("Name");
    sheet.getRangeByIndex(1, 5).setText("Classroom");

    int i = 0;
    for (final item in data) {
      print("Data not found");
      sheet.getRangeByIndex(i + 2, 1).setText(item['Duration']);
      sheet.getRangeByIndex(i + 2, 2).setText(item['inTime']);
      sheet.getRangeByIndex(i + 2, 3).setText(item['outTime']);
      sheet.getRangeByIndex(i + 2, 4).setText(item['name']);
      sheet.getRangeByIndex(i + 2, 5).setText(item['geofenceName']);
      i++;
    }

    final List<int> bytes = workbook.saveAsStream();
    final directory = await getExternalStorageDirectory();
    final filePath = await getDownloadPath();
    print(filePath);
    File('${filePath.toString()}/Attendance.xlsx').writeAsBytes(bytes);
    print("File downloaded");
  }

  Future<String?> getDownloadPath() async {
    Directory? directory;
    try {
      if (Platform.isIOS) {
        directory = await getApplicationDocumentsDirectory();
      } else {
        directory = Directory('/storage/emulated/0/Download');
        if (!await directory.exists()) {
          directory = await getExternalStorageDirectory();
        }
      }
    } catch (err) {
      print("Error path not found");
    }
    return directory?.path;
  }
}