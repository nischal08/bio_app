import 'package:flutter/material.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';

class PdfViewer extends StatefulWidget {
  static const routeName = "/pdf-viewer";

  @override
  _PdfViewerState createState() => _PdfViewerState();
}

class _PdfViewerState extends State<PdfViewer> {
  int currentPage = 0;
  bool _visible = true;
  @override
  void initState() {
    // TODO: implement initState
    Future.delayed(
        Duration(
          seconds: 3,
        ), () {
      setState(() {
        _visible = false;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    String path = ModalRoute.of(context)!.settings.arguments as String;
    return Scaffold(
      appBar: AppBar(
        title: Text("PDF Viewer"),
      ),
      body: Column(
        children: [
          Expanded(
            child: Stack(
              children: [
                Container(
                  child: PDFView(
                    onPageChanged: (page, total) {
                      currentPage = page!;
                      setState(() {});
                    },
                    defaultPage: 0,
                    fitPolicy: FitPolicy.BOTH,
                    filePath: path,
                    enableSwipe: true,
                    swipeHorizontal: true,
                    onError: (error) {
                      print(error.toString());
                    },
                    onPageError: (page, error) {
                      print('$page: ${error.toString()}');
                    },
                    // onViewCreated: (PDFViewController pdfViewController) {
                    //   _controller.complete(pdfViewController);
                    // },
                    // onPageChanged: (int page, int total) {
                    //   print('page change: $page/$total');
                    // },
                  ),
                ),
             if(_visible)   Container(
               padding: EdgeInsets.only(top: 20),
                  alignment: Alignment.topCenter,
                  child: Text(
                    "Double tap or use finger gesture to zoom",
                    style: Theme.of(context).textTheme.subtitle1,
                  ),
                )
              ],
            ),
          ),
          Text(
            "page $currentPage",
            style: Theme.of(context).textTheme.subtitle1,
          ),
          SizedBox(
            height: 20,
          )
        ],
      ),
    );
  }
}
