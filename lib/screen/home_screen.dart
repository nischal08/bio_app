import 'package:bio_app/widgets/home_appbar.dart';
import 'package:bio_app/widgets/main_drawer.dart';
import 'package:bio_app/widgets/reusable_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:url_launcher/url_launcher.dart';

class HomeScreen extends StatelessWidget {
   HomeScreen({Key? key}) : super(key: key);

List<Map<String, String>> _socialInfo = [
    {"assets/logos/linkedIn.png": "https://np.linkedin.com/in/nirajkaranjeet"},
    {"assets/logos/twitter.png": "https://twitter.com/nischa68"},
    {"assets/logos/instagram.png": "https://www.instagram.com/nischalkat/"},
    {"assets/logos/facebook.png": "https://www.facebook.com/Nischal.Karanjeet"},
    {"assets/logos/tiktok.png": "https://tiktok.com"},
    {"assets/logos/github.png": "https://github.com/nischal08"}
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawerEnableOpenDragGesture: true,
      drawer: Drawer(
        child: MainDrawer(),
      ),
      extendBodyBehindAppBar: true,
      backgroundColor: Theme.of(context).canvasColor,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(260),
        child: MainAppbar(),
      ),
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
          headline6Text(context, text: text, color: Colors.black)
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
            boxShadow: [
              BoxShadow(
                blurRadius: 1,
                color: Colors.grey,
                offset: Offset(2, 2),
                spreadRadius: 1,
              ),
            ],
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
          child: headline6Text(
            context,
            text: title,
            boldText: true,
          ),
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width - 150,
          child: Divider(
            color: Theme.of(context).primaryColorDark,
            thickness: 1.5,
          ),
        )
      ],
    );
  }

  _followMe(context) {
    return Container(
      height: 300,
      child: Column(
        children: [
          _legendTitle(context, title: "Follow Me"),
          SizedBox(height: 20,),
          Flexible(
            child: Container(
              child: GridView.builder(
                physics: NeverScrollableScrollPhysics(),
                itemCount: _socialInfo.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  childAspectRatio: 16/9,
                  crossAxisSpacing: 40,
                  mainAxisSpacing: 40,
                ),
                itemBuilder: (context, index) => _logo(
                  _socialInfo[index].keys.first,
                  url: _socialInfo[index].values.first,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  
  _logo(imageUrl, {String? url}) {
    return GestureDetector(
      onTap: () => url == null ? () {} : _launchURL(url),
      child: Image.asset(
        imageUrl,
      ),
    );
  }

  void _launchURL(url) async =>
      await canLaunch(url) ? await launch(url) : throw 'Could not launch $url';
}
