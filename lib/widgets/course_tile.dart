import 'package:flutter/material.dart';

import '../screen/pdf_viewer.dart';

class CourseTile extends StatelessWidget {
  const CourseTile({
    Key? key,
    required this.assetPDFPath,
    required this.context,
    required this.text,
  }) : super(key: key);

  final String assetPDFPath;
  final BuildContext context;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: InkWell(
        onTap: () => Navigator.of(context)
            .pushNamed(PdfViewer.routeName, arguments: assetPDFPath),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: SizedBox(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  text,
                  style: Theme.of(context).textTheme.headline6,
                ),
                Icon(Icons.arrow_forward_ios)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
