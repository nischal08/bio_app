import 'dart:io';

import 'package:bio_app/screen/course_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';

class OfflineCoursesScreen extends StatefulWidget {
  OfflineCoursesScreen({Key? key}) : super(key: key);
  static const routeName = "/offline-courses";
  @override
  _OfflineCoursesScreenState createState() => _OfflineCoursesScreenState();
}

class _OfflineCoursesScreenState extends State<OfflineCoursesScreen> {
  String assetPDFPath = "";
  List<String> _courseList = [
    "Microproccessor",
    "Discrete Structure",
    "Java Programming",
    "Compiler",
    "Calculus",
    "Real Time System"
  ];

  @override
  void initState() {
    super.initState();

    getFileFromAsset("assets/pdf/example.pdf").then((f) {
      setState(() {
        assetPDFPath = f.path;
      });
    });
  }

  Future<File> getFileFromAsset(String asset) async {
    try {
      var data = await rootBundle.load(asset);
      var bytes = data.buffer.asUint8List();
      var dir = await getApplicationDocumentsDirectory();
      File file = File("${dir.path}/mypdf.pdf");
      File assetFile = await file.writeAsBytes(bytes);
      return assetFile;
    } catch (e) {
      throw Exception("Error opening asset file");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Offline Courses"),
      ),
      body: Container(
        padding: EdgeInsets.only(top: 10),
        alignment: Alignment.center,
        child: ListView.builder(
          itemCount: _courseList.length,
          itemBuilder: (context, index) => CourseTile(
              assetPDFPath: assetPDFPath,
              context: context,
              text: _courseList[index]),
        ),
      ),
    );
  }
}
