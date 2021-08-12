import 'package:bio_app/screen/url-constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:url_launcher/url_launcher.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: Theme.of(context).canvasColor,
      appBar: _appbar(context),
      body: Container(
        height: MediaQuery.of(context).size.height,
        child: _body(
          context,
        ),
      ),
    );
  }

  _body(context) {
    return ListView(
      children: [
        _contact(context),
        _followMe(context),
      ],
    );
  }

  _contact(context) {
    return Container(
      padding: EdgeInsets.only(top: 20, bottom: 5),
      child: Column(
        children: [
          _legendTitle(context, title: "Contact Me"),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: Column(
              children: [
                GestureDetector(
                  onTap: () {
                    ScaffoldMessenger.of(context).clearSnackBars();
                    Clipboard.setData(
                      ClipboardData(text: "nischal.karanjit@gmail.com"),
                    );
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        duration: Duration(seconds: 2),
                        content: Text("Email Copied"),
                      ),
                    );
                  },
                  child: _iconWithText(context,
                      icon: Icons.mail, text: "nischal.karanjit@gmail.com"),
                ),
                SizedBox(
                  height: 20,
                ),
                GestureDetector(
                  onTap: () {
                    ScaffoldMessenger.of(context).clearSnackBars();
                    Clipboard.setData(
                      ClipboardData(text: "+977 9860080118"),
                    );
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        duration: Duration(seconds: 2),
                        content: Text("Phone number copied"),
                      ),
                    );
                  },
                  child: _iconWithText(context,
                      icon: Icons.phone, text: "+977 9860080118"),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Container _iconWithText(context,
      {required IconData icon, required String text}) {
    return Container(
      child: Row(
        children: [
          CircleAvatar(
            backgroundColor: Theme.of(context).primaryColorDark,
            child: Icon(
              icon,
              color: Colors.white,
            ),
          ),
          SizedBox(
            width: 8,
          ),
          _headline6Text(context, text: text, color: Colors.black)
        ],
      ),
    );
  }

  Row _legendTitle(context, {required String title}) {
    return Row(
      children: [
        Container(
          width: 150,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(8),
              bottomRight: Radius.circular(8),
            ),
            color: Theme.of(context).primaryColorDark,
          ),
          padding: EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 12,
          ),
          child: _headline6Text(
            context,
            text: title,
            boldText: true,
          ),
        ),
        Expanded(
          child: Divider(
            color: Theme.of(context).primaryColorDark,
            thickness: 1.5,
          ),
        )
      ],
    );
  }

  _followMe(context) {
    return Expanded(
      child: Container(
        height: 300,
        child: Column(
          children: [
            _legendTitle(context, title: "Follow Me"),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _logo("assets/logos/linkedIn.png",
                          url: "https://np.linkedin.com/in/nirajkaranjeet"),
                      _logo("assets/logos/twitter.png",
                          url: "https://twitter.com/nischa68"),
                      _logo("assets/logos/instagram.png",
                          url: "https://www.instagram.com/nischalkat/"),
                    ],
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _logo("assets/logos/facebook.png",
                          url: "https://www.facebook.com/Nischal.Karanjeet"),
                      _logo("assets/logos/tiktok.png",
                          url: "https://tiktok.com"),
                      _logo("assets/logos/github.png",
                          url: "https://github.com/nischal08"),
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  _logo(imageUrl, {String? url}) {
    return GestureDetector(
      onTap: () => url == null ? () {} : _launchURL(url),
      child: Image.asset(
        imageUrl,
        height: 60,
      ),
    );
  }

  void _launchURL(url) async =>
      await canLaunch(url) ? await launch(url) : throw 'Could not launch $url';
  AppBar _appbar(BuildContext context) {
    return AppBar(
      elevation: 0,
      toolbarHeight: 260,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(15),
          bottomRight: Radius.circular(15),
        ),
      ),
      leading: Container(
        padding: EdgeInsets.all(14),
        alignment: Alignment.topLeft,
        child: Icon(
          Icons.menu_rounded,
          size: 34,
        ),
      ),
      centerTitle: true,
      flexibleSpace: SafeArea(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _headline5Text(context, text: "Profile"),
              _userImage(context),
              Column(
                children: [
                  _headline6Text(context, text: "Niraj Karanjeet"),
                  SizedBox(
                    height: 3,
                  ),
                  _headline6Text(context, text: "Flutter Developer"),
                ],
              ),
              SizedBox(
                height: 8,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _subtitleText(context, text: "Age : 24"),
                  _subtitleText(context, text: "Reg. No.: 675785Y"),
                ],
              )
            ],
          ),
        ),
      ),
      backgroundColor: Theme.of(context).primaryColor,
    );
  }

  Text _headline6Text(BuildContext context,
      {required String text, Color? color, bool boldText = false}) {
    return Text(
      text,
      style: Theme.of(context).textTheme.headline6!.copyWith(
          color: color ?? Colors.white,
          fontWeight: boldText ? FontWeight.w600 : FontWeight.normal),
    );
  }

  Text _headline5Text(BuildContext context,
      {required String text, Color? color}) {
    return Text(
      text,
      style: Theme.of(context).textTheme.headline5!.copyWith(
            color: color ?? Colors.white,
            fontWeight: FontWeight.w600,
          ),
    );
  }

  Text _subtitleText(BuildContext context,
      {required String text, Color? color}) {
    return Text(
      text,
      style: Theme.of(context).textTheme.subtitle1!.copyWith(
            color: color ?? Colors.white,
            fontWeight: FontWeight.w600,
          ),
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
