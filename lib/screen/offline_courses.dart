import 'dart:math';
import 'package:bio_app/controller.dart/data.dart';
import 'package:bio_app/widgets/course_tile.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class OfflineCoursesScreen extends StatefulWidget {
  OfflineCoursesScreen({Key? key}) : super(key: key);
  static const routeName = "/offline-courses";
  @override
  _OfflineCoursesScreenState createState() => _OfflineCoursesScreenState();
}

class _OfflineCoursesScreenState extends State<OfflineCoursesScreen> {
  String assetPDFPath = "";
 
  @override
  void initState() {
    super.initState();

    Provider.of<Data>(context, listen: false)
        .getFileFromAsset(asset: "assets/pdf/example.pdf", fileName: "syllabus.pdf")
        .then((f) {
      setState(() {
        assetPDFPath = f.path;
      });
    });
  }

  final _random = Random();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Offline Courses"),
      ),
      body: Consumer<Data>( 
        builder: (__, data, _) => 
         Container(
          padding: EdgeInsets.only(top: 10),
          alignment: Alignment.center,
          child: ListView.builder(
            itemCount: data.courseList.length,
            itemBuilder: (context, index) => CourseTile(
                color: Colors.primaries[_random.nextInt(Colors.primaries.length)]
                        [_random.nextInt(7) * 100] ??
                    Theme.of(context).primaryColor,
                assetPDFPath: assetPDFPath,
                context: context,
                text: data.courseList[index]),
          ),
        ),
      ),
    );
  }
}
