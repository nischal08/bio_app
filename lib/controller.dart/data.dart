import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';

class Data extends ChangeNotifier {
  List<Map<String, String>> socialInfo = [
    {"assets/logos/linkedIn.png": "https://np.linkedin.com/in/nirajkaranjeet"},
    {"assets/logos/twitter.png": "https://twitter.com/nischa68"},
    {"assets/logos/instagram.png": "https://www.instagram.com/nischalkat/"},
    {"assets/logos/facebook.png": "https://www.facebook.com/Nischal.Karanjeet"},
    {"assets/logos/tiktok.png": "https://tiktok.com"},
    {"assets/logos/github.png": "https://github.com/nischal08"}
  ];
  List<String> courseList = [
    "Microproccessor",
    "Discrete Structure",
    "Java Programming",
    "Compiler",
    "Calculus",
    "Real Time System"
  ];
  Future<File> getFileFromAsset(
      {required String asset, required String fileName}) async {
    try {
      var data = await rootBundle.load(asset);
      var bytes = data.buffer.asUint8List();
      var dir = await getApplicationDocumentsDirectory();
      File file = File("${dir.path}/$fileName");
      File assetFile = await file.writeAsBytes(bytes);
      return assetFile;
    } catch (e) {
      throw Exception("Error opening asset file");
    }
  }
}
