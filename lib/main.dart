import 'package:bio_app/screen/home_screen.dart';
import 'package:bio_app/screen/offline_courses.dart';
import 'package:bio_app/screen/pdf_viewer.dart';
import 'package:bio_app/screen/web_view_screen.dart';
import 'package:bio_app/screen/website-menus_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(primarySwatch: Colors.red, canvasColor: Colors.white),
      home: HomeScreen(),
      routes: {
        WebviewScreen.routeName: (context) => WebviewScreen(),
        OfflineCoursesScreen.routeName:(context)=>OfflineCoursesScreen(),
        PdfViewer.routeName:(context)=>PdfViewer(),
        WebMenuScreen.routeName:(context)=>WebMenuScreen(),

      },
    );
  }
}
