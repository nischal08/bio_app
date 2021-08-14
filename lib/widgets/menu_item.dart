import 'package:bio_app/screen/web_view_screen.dart';
import 'package:flutter/material.dart';

class CategoryItem extends StatelessWidget {
  final String url;
  final String title;
  final Color color;

  const CategoryItem({
    required this.title,
    required this.color,
    required this.url,
  });

  void selectCategory(context) {
    Navigator.of(context).pushNamed(WebviewScreen.routeName, arguments: url);
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(8),
      onTap: () => selectCategory(context),
      child: Container(
        padding: const EdgeInsets.all(20),
        alignment: Alignment.center,
        child: Text(
          title,
          textAlign: TextAlign.center,
          style: Theme.of(context)
              .textTheme
              .headline6!
              .copyWith(color: Colors.black),
        ),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              color.withOpacity(0.3),
              color,
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            tileMode: TileMode.repeated,
          ),
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    );
  }
}
