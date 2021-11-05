import 'dart:io';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/pdf.dart';
// import 'package:syncfusion_flutter_pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:pdf_flutter/pdfviewer.dart';
// ignore: unused_import
import 'package:xml/xml.dart';

void main() {
  runApp(MyApp());
}

@override
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: Colors.teal,
      ),
      initialRoute: MyHomePage.id,
      routes: {
        MyHomePage.id: (context) => MyHomePage(),
        PDFScreen.id: (context) => PDFScreen(),
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  static String id = 'my_home_page';

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<String> items = ["Orange", "Tea", "Coffee", "Apples"];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          child: Text(
            'Create PDF',
            style: TextStyle(),
          ),
          onPressed: _createPDF,
        ),
      ),
    );
  }

  Future<void> _createPDF() async {
    final pdf = pw.Document();

    pdf.addPage(
      pw.Page(build: (pw.Context context) {
        var SvgPicture;
        return pw.Column(
            mainAxisAlignment: pw.MainAxisAlignment.start,
            crossAxisAlignment: pw.CrossAxisAlignment.center,
            children: [
              pw.Container(
                height: 50.0,
                width: 50.0,
              ), //color ka puchna hai
              pw.Text('Carrefour Hague!',
                  style: pw.TextStyle(
                      fontWeight: pw.FontWeight.bold, fontSize: 19)),
              pw.Padding(padding: pw.EdgeInsets.only(bottom: 14)),
              pw.Divider(thickness: 1, color: PdfColor.fromHex("#BFBFBF")),
              pw.Row(
                children: [
                  pw.Column(
                      crossAxisAlignment: pw.CrossAxisAlignment.start,
                      children: [
                        pw.Padding(padding: pw.EdgeInsets.only(bottom: 11)),
                        pw.Text('Order Receipt',
                            style: pw.TextStyle(
                              fontWeight: pw.FontWeight.bold,
                              fontSize: 20,
                            )),
                        pw.Text('Date: Friday,May 10. 2020',
                            style: pw.TextStyle()),
                        pw.Text(
                          'Order Id: 22320638',
                        ),
                        pw.Text('Postal Code: 239810')
                      ]),
                  pw.Expanded(
                    child: pw.SizedBox(),
                  ),
                  pw.Column(
                    crossAxisAlignment: pw.CrossAxisAlignment.start,
                    children: [
                      pw.Text('Billed to:',
                          style: pw.TextStyle(
                            fontWeight: pw.FontWeight.bold,
                          )),
                      pw.Text('Visa...000'),
                      pw.Text('Georgio  Morder'),
                      pw.Text('945 Madison Avenue'),
                      pw.Text('NewYork, NY 10021'),
                    ],
                  ),
                ],
              ),

              pw.Padding(padding: pw.EdgeInsets.only(bottom: 14)),
              pw.Divider(thickness: 1, color: PdfColor.fromHex("#BFBFBF")),
              pw.Row(
                children: [
                  pw.Padding(padding: pw.EdgeInsets.only(bottom: 11)),
                  pw.Text('Description',
                      style: pw.TextStyle(
                        fontWeight: pw.FontWeight.bold,
                        fontSize: 16,
                      )),
                  pw.Expanded(
                    child: pw.SizedBox(),
                  ),
                  pw.Container(
                    width: 25,
                    alignment: pw.Alignment.center,
                  ),
                  pw.Text('Price',
                      style: pw.TextStyle(
                        fontWeight: pw.FontWeight.bold,
                        fontSize: 16,
                      )),
                  pw.Container(
                    width: 25,
                    alignment: pw.Alignment.center,
                  ),
                  pw.Text('Qty',
                      style: pw.TextStyle(
                        fontWeight: pw.FontWeight.bold,
                        fontSize: 16,
                      ))
                ],
              ),
              pw.Padding(padding: pw.EdgeInsets.only(bottom: 25)),
              pw.ListView.builder(
                itemCount: items.length,
                // shrinkWrap: true,
                // primary: false,
                // ignore: missing_return
                itemBuilder: (context, i) {
                  return pw.Row(children: [
                    pw.Text(items[i]),
                    pw.Expanded(
                      child: pw.SizedBox(),
                    ),
                    pw.Container(
                      width: 70,
                      alignment: pw.Alignment.center,
                      child: pw.Text('\$25.0'),
                    ),
                    pw.Container(
                      width: 40,
                      alignment: pw.Alignment.center,
                      child: pw.Text('\$ 5 kg'),
                    ),
                  ]);
                },
              ),
              pw.Padding(padding: pw.EdgeInsets.symmetric(vertical: 14)),

              pw.Row(children: [
                pw.Text('Subtotal',
                    style: pw.TextStyle(
                        fontSize: 16, fontWeight: pw.FontWeight.bold)),
                pw.Expanded(
                  child: pw.SizedBox(),
                ),
                pw.Text(' \$ 1.99',
                    style: pw.TextStyle(fontWeight: pw.FontWeight.bold))
              ]),

              pw.Row(children: [
                pw.Text('GST(10% of \$ 1.99)',
                    style: pw.TextStyle(
                      fontSize: 16,
                      fontWeight: pw.FontWeight.bold,
                    )),
                pw.Expanded(
                  child: pw.SizedBox(),
                ),
                pw.Text('\$ 4.238',
                    style: pw.TextStyle(fontWeight: pw.FontWeight.bold))
              ]),
              pw.Padding(padding: pw.EdgeInsets.symmetric(vertical: 14)),
              pw.Divider(thickness: 1, color: PdfColor.fromHex("#BFBFBF")),
              pw.Row(children: [
                pw.Text('Total',
                    style: pw.TextStyle(
                      fontSize: 16,
                      fontWeight: pw.FontWeight.bold,
                    )),
                pw.Expanded(
                  child: pw.SizedBox(),
                ),
                pw.Text('\$ 4.238',
                    style: pw.TextStyle(fontWeight: pw.FontWeight.bold))
              ]),
              pw.Padding(padding: pw.EdgeInsets.only(bottom: 14)),
              pw.Divider(thickness: 1, color: PdfColor.fromHex("#BFBFBF")),

              pw.Padding(padding: pw.EdgeInsets.only(bottom: 50)),
              pw.Row(children: [
                pw.Column(
                  crossAxisAlignment: pw.CrossAxisAlignment.start,
                  children: [
                    SvgPicture.asset(
                      'assets/images/dailyYou.svg',
                      width: 20,
                      height: 20,
                    ),
                    pw.Text(
                        'To view the receipt on your mobile \n device scan the QR code below from \n your mobile device with \n QR code scanner',
                        style: pw.TextStyle()),
                  ],
                ),
                pw.Expanded(
                  child: pw.SizedBox(),
                ),
                pw.Column(
                    crossAxisAlignment: pw.CrossAxisAlignment.end,
                    children: [
                      pw.Padding(
                        padding: pw.EdgeInsets.only(right: 5),
                      ),
                      // pw.Container(
                      //     width: 90,
                      //     height: 90,
                      //     child: pw.SvgImage(
                      //         svg: 'assets/images/dailyYou.svg',
                      //         width: 90,
                      //         height: 90,
                      //         fit: pw.BoxFit.fill)),
                    ]),
              ]),
            ]);
      }),
    );

    try {
      // used
      Directory directory = await getTemporaryDirectory();
      print('${directory.path}/receipt.pdf');
      final file = File("${directory.path}/receipt.pdf");
      await file.writeAsBytes(await pdf.save());
      print(file.absolute.path);
      // Navigator.of(context).pushNamed(PDFScreen.id);
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (_) {
                return PDFScreen(
                  pathPDF: file.absolute.path,
                );
              },
              settings: RouteSettings(name: PDFScreen.id)));
    } catch (e) {
      print('exception');
      print(e.toString());
    }
  }
}
