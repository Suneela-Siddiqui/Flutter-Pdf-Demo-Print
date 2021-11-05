import 'package:flutter/material.dart';
import 'package:flutter_full_pdf_viewer/full_pdf_viewer_scaffold.dart';
import 'package:share/share.dart';

class PDFScreen extends StatelessWidget {
  static String id = 'pdf_viewer';
  final String pathPDF;
  PDFScreen({this.pathPDF});
  _onShare() async {
    Share.shareFiles([pathPDF], text: 'My Receipt');
  }

  @override
  Widget build(BuildContext context) {
    return PDFViewerScaffold(
        appBar: AppBar(
          title: Text("Receipt"),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.share),
              onPressed: _onShare,
            ),
          ],
        ),
        path: pathPDF);
  }
}
