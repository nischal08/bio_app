import 'dart:io';

import 'package:bio_app/screen/pdf_viewer.dart';
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
          itemBuilder: (context, index) =>
              _courseTile(context, text: _courseList[index]),
        ),
      ),
    );
  }

  Card _courseTile(BuildContext context, {required String text}) {
    return Card(
      elevation: 2,
      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: InkWell(
        onTap: () =>Navigator.of(context).pushNamed(PdfViewer.routeName,arguments: assetPDFPath),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: SizedBox(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  text,
                  style: Theme.of(context).textTheme.headline6,
                ),
                Icon(Icons.arrow_forward_ios)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
