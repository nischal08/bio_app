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

  Future<File> getFileFromAsset(String asset) async {
    try {
      var data = await rootBundle.load(asset);
      var bytes = data.buffer.asUint8List();
      var dir = await getApplicationDocumentsDirectory();
      File file = File("${dir.path}/cv.pdf");
      File assetFile = await file.writeAsBytes(bytes);
      return assetFile;
    } catch (e) {
      throw Exception("Error opening asset file");
    }
  }

}
