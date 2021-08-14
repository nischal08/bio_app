import 'dart:math';

import 'package:bio_app/widgets/menu_item.dart';
import 'package:flutter/material.dart';

class WebMenuScreen extends StatelessWidget {
  static const routeName = "/web-menu";

  List<Map<String, String>> menuList = [
    {"Jewellery & Accessories": "jewelry-and-accessories"},
    {"Clothing & Shoes": "clothing-and-shoes"},
    {"Home & Living": "home-and-living"},
    {"Wedding & Party": "wedding-and-party"},
    {"Toys & Entertainment": "toys-and-entertainment"},
    {"Art & Collectibles": "art-and-collectibles"},
    {"Craft Supplies & Tools": "craft-supplies-and-tools"},
    {"Vintage": "vintage"},
  ];
  final _random = Random();
  String baseUrl = "https://www.etsy.com/c/";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Esty Menu"),
      ),
      body: GridView.builder(
        padding: EdgeInsets.all(20),
        itemCount: menuList.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 16 / 12,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
        ),
        itemBuilder: (context, index) => CategoryItem(
          title: menuList[index].keys.first,
          color: Colors.primaries[_random.nextInt(Colors.primaries.length)]
                  [_random.nextInt(9) * 100] ??
              Theme.of(context).primaryColor,
          url: "$baseUrl${menuList[index].values.first}",
        ),
      ),
    );
  }
}
