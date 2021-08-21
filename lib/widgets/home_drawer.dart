import 'package:bio_app/screen/offline_courses.dart';
import 'package:bio_app/screen/web_view_screen.dart';
import 'package:bio_app/screen/website-menus_screen.dart';
import 'package:flutter/material.dart';

class MainDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Container(
          height: 70,
          child: DrawerHeader(
            child: Text(
              "Projects".toUpperCase(),
              style: Theme.of(context).textTheme.headline5!.copyWith(
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).primaryColor),
            ),
          ),
        ),
        _drawerTile(context, icon: Icons.library_books, text: "Medium",
            onTap: () {
          Navigator.pushNamed(context, WebviewScreen.routeName,
              arguments: "https://medium.com/");
        }),
        Divider(
          color: Colors.grey.shade300,
          height: 0,
        ),
        _drawerTile(context, icon: Icons.shopping_bag, text: "Esty Ecommerce",
            onTap: () {
          Navigator.pushNamed(
            context,
            WebMenuScreen.routeName,
          );
        }),
        Divider(
          color: Colors.grey.shade300,
          height: 0,
        ),
        _drawerTile(context, icon: Icons.auto_stories, text: "Offline Courses",
            onTap: () {
          Navigator.pushNamed(
            context,
            OfflineCoursesScreen.routeName,
          );
        }),
        Divider(
          color: Colors.grey.shade300,
          height: 0,
        ),
      ],
    );
  }

  ListTile _drawerTile(BuildContext context,
      {required IconData icon,
      required String text,
      required void Function() onTap}) {
    return ListTile(
      leading: Icon(
        icon,
        color: Theme.of(context).primaryColor,
        size: 30,
      ),
      trailing: Icon(
        Icons.arrow_forward_ios,
        color: Theme.of(context).primaryColor,
      ),
      title: Text(
        text,
        style: Theme.of(context).textTheme.subtitle1,
      ),
      onTap: onTap,
    );
  }
}
