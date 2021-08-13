import 'dart:io';

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

    getFileFromAsset("assets/example.pdf").then((f) {
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
        alignment: Alignment.center,
        child: ListView.builder(
          itemCount: _courseList.length,
          itemBuilder: (context, index) =>
              _courseTile(context, text: _courseList[index]),
        ),
      ),
    );
  }

  Card _courseTile(BuildContext context, {required String text}) {
    return Card(
      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: InkWell(
        onTap: () {},
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: SizedBox(
            child: Text(
              text,
              style: Theme.of(context).textTheme.headline6,
            ),
          ),
        ),
      ),
    );
  }
}
