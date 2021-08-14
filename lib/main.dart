import 'package:bio_app/screen/home_screen.dart';
import 'package:bio_app/screen/offline_courses.dart';
import 'package:bio_app/screen/pdf_viewer.dart';
import 'package:bio_app/screen/splash-screen.dart';
import 'package:bio_app/screen/web_view_screen.dart';
import 'package:bio_app/screen/website-menus_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'controller.dart/data.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => Data(),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
            primarySwatch: Colors.red,
            canvasColor: Colors.white,
            accentColor: Colors.amberAccent),
        home: SplashScreen(),
        routes: {
          WebviewScreen.routeName: (context) => WebviewScreen(),
          OfflineCoursesScreen.routeName: (context) => OfflineCoursesScreen(),
          PdfViewer.routeName: (context) => PdfViewer(),
          WebMenuScreen.routeName: (context) => WebMenuScreen(),
          HomeScreen.routeName:(context)=>HomeScreen()
        },
      ),
    );
  }
}
