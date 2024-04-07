import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:syncfusion_flutter_xlsio/xlsio.dart' as excel;
import 'package:path_provider/path_provider.dart';

final db = FirebaseFirestore.instance;
List<Map<String, dynamic>> excelData = [];

class ShowData extends StatefulWidget {
  const ShowData({super.key});

  @override
  State<ShowData> createState() => _ShowDataState();
}

class _ShowDataState extends State<ShowData> {

  @override

  String path1="/attendance record/Manipal University Jaipur/Academic Block 2/2024-04-04/Sharda Pai Auditorium";

  

  Widget build(BuildContext context) {
    return Scaffold(
      
      floatingActionButton: IconButton(
        onPressed: () {
          exportDataToExcel(excelData);
          
        
        
        },
        icon: const Icon(Icons.download)),
      appBar: AppBar(
        title: Text("Attendance Record"),
        centerTitle: true,
        ),
        body: StreamBuilder(
          stream: db.collection("${path1}").snapshots(),
          builder: (context,snapshot){
            if(snapshot.connectionState==ConnectionState.active){
              if(snapshot.hasData){
                return ListView.builder(itemBuilder: (context,index){
                  String name="${snapshot.data!.docs[index]["name"]}";
                  String inTime="${snapshot.data!.docs[index]["inTime"]}";
                  String outTime="${snapshot.data!.docs[index]["outTime"]}";
                  String office="${snapshot.data!.docs[index]["geofenceName"]}";
                  excelData.add({
                      'Name': name,
                      'Office': office,
                      'Entry Time': inTime,
                      'Exit Time': outTime
                    });
                  return ListTile(
                    leading: CircleAvatar(
                      child: Text("${index+1}"),
                    ),
                    title: Text("${name}"),
                    subtitle: Text("${inTime}"+" to "+"${outTime}"+" in "+"${office}"),
                    
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

    sheet.getRangeByIndex(1, 1).setText("Name");
    sheet.getRangeByIndex(1, 2).setText("Geofence");
    sheet.getRangeByIndex(1, 3).setText("Entry Time");
    sheet.getRangeByIndex(1, 4).setText("Exit Time");

    int i = 0;
    for (final item in data) {
      print("Data not found");
      sheet.getRangeByIndex(i + 2, 1).setText(item['Name']);
      sheet.getRangeByIndex(i + 2, 2).setText(item['Office']);
      sheet.getRangeByIndex(i + 2, 3).setText(item['Entry Time']);
      sheet.getRangeByIndex(i + 2, 4).setText(item['Exit Time']);
      i++;
    }

    final List<int> bytes = workbook.saveAsStream();
    final directory = await getExternalStorageDirectory();
    final filePath = await getDownloadPath();
    print(filePath);
    final permissionStatus = await Permission.storage.status;
          if (permissionStatus.isDenied) {
              // Here just ask for the permission for the first time
              await Permission.storage.request();

              // I noticed that sometimes popup won't show after user press deny
              // so I do the check once again but now go straight to appSettings
              if (permissionStatus.isDenied) {
                  await openAppSettings();
              }
          } else if (permissionStatus.isPermanentlyDenied) {
              // Here open app settings for user to manually enable permission in case 
              // where permission was permanently denied
              await openAppSettings();
          } else {
              // Do stuff that require permission here
                  File('${filePath.toString()}/Attendance'+DateTime.now().toString()+'.xlsx').writeAsBytes(bytes);
                  print("File downloaded");
          }

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


