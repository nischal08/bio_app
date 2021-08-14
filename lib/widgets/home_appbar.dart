import 'package:bio_app/constant/url_constant.dart';
import 'package:bio_app/screen/pdf_viewer.dart';
import 'package:flutter/material.dart';
import 'reusable_widgets.dart';

class MainAppbar extends StatelessWidget {
  final String assetPDFPath;
  const MainAppbar({Key? key, required this.assetPDFPath})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 4,
      // toolbarHeight: 260,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(15),
          bottomRight: Radius.circular(15),
        ),
      ),
      leading: Builder(
        builder: (context) => GestureDetector(
          onTap: () => Scaffold.of(context).openDrawer(),
          child: Container(
            padding: EdgeInsets.all(14),
            alignment: Alignment.topLeft,
            child: Icon(
              Icons.menu_rounded,
              size: 34,
            ),
          ),
        ),
      ),
      centerTitle: true,
      flexibleSpace: SafeArea(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              headline5Text(context, text: "Profile"),
              _userImage(context),
              Column(
                children: [
                  headline6Text(context, text: "Niraj Karanjeet"),
                  SizedBox(
                    height: 3,
                  ),
                  headline6Text(context, text: "Flutter Developer"),
                ],
              ),
              SizedBox(
                height: 8,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  subtitleText(context, text: "Age : 24"),
                  ElevatedButton.icon(
                    style: ButtonStyle(
                      elevation: MaterialStateProperty.all<double>(0),
                      backgroundColor: MaterialStateProperty.all<Color>(
                        Colors.transparent,
                      ),
                    ),
                    onPressed: () {
                      Navigator.pushNamed(context, PdfViewer.routeName,
                          arguments: assetPDFPath);
                    },
                    icon: Icon(
                      Icons.preview,
                    ),
                    label: Text("RESUME"),
                  ),
                  subtitleText(context, text: "Reg. No.: 675785Y"),
                ],
              )
            ],
          ),
        ),
      ),
      backgroundColor: Theme.of(context).primaryColor,
    );
  }

  Container _userImage(BuildContext context) {
    return Container(
      height: 90,
      width: 90,
      decoration: BoxDecoration(
        border: Border.all(
          width: 3,
          color: Colors.white,
        ),
        color: Theme.of(context).primaryColorLight,
        borderRadius: BorderRadius.circular(50),
        image: DecorationImage(
            image: AssetImage(
              userImage,
            ),
            fit: BoxFit.cover),
      ),
    );
  }
}
