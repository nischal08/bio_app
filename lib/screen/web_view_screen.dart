
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebviewScreen extends StatefulWidget {
  static const routeName = "/webview";
  const WebviewScreen({Key? key}) : super(key: key);

  @override
  _WebviewScreenState createState() => _WebviewScreenState();
}

class _WebviewScreenState extends State<WebviewScreen> {
  bool isLoading = true;
  final _key = UniqueKey();
  JavascriptChannel _toasterJavascriptChannel(BuildContext context) {
    return JavascriptChannel(
        name: 'Toaster',
        onMessageReceived: (JavascriptMessage message) {
          // ignore: deprecated_member_use
          Scaffold.of(context).showSnackBar(
            SnackBar(content: Text(message.message)),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    String url = ModalRoute.of(context)!.settings.arguments as String;
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: Theme.of(context).canvasColor,
      body: SafeArea(
        child: Stack(
          children: [
            WebView(
              key: _key,
              gestureNavigationEnabled: true,
              initialUrl: url,
              javascriptMode: JavascriptMode.unrestricted,
              onProgress: (int progress) {
                print("WebView is loading (progress : $progress%)");
                if (progress == 100) {
                  isLoading = false;
                  setState(() {});
                }
              },
              javascriptChannels: <JavascriptChannel>{
                _toasterJavascriptChannel(context),
              },

            ),
            isLoading
                ? Center(
                    child: Card(
                      elevation: 4,
                      color: Colors.white,
                      child: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            _getLoadingIndicator(),
                            SizedBox(
                              height: 12,
                            ),
                            Text(
                              "Please Wait",
                              style: Theme.of(context).textTheme.subtitle1,
                            )
                          ],
                        ),
                      ),
                    ),
                  )
                : Stack(),
          ],
        ),
      ),
    );
  }

  Widget _getLoadingIndicator() {
    return Container(
        child: CircularProgressIndicator(strokeWidth: 3),
        width: 32,
        height: 32);
  }
}
