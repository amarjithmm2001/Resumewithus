import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:open_file/open_file.dart';

Future<void> generateAndOpenPdf() async {
  final pdf = pw.Document();

  pdf.addPage(
    pw.Page(
      build: (pw.Context context) {
        return pw.Center(
          child: pw.Column(
            mainAxisAlignment: pw.MainAxisAlignment.center,
            children: [
              pw.Text(
                'Welcome to the Example Page!',
                style:
                    pw.TextStyle(fontSize: 24, fontWeight: pw.FontWeight.bold),
              ),
              pw.SizedBox(height: 20),
              pw.Text(
                'This is a simple Flutter page example.',
                style: pw.TextStyle(fontSize: 16),
              ),
              pw.SizedBox(height: 20),
              pw.Text(
                'Press Me',
                style: pw.TextStyle(fontSize: 16, color: PdfColors.blue),
              ),
            ],
          ),
        );
      },
    ),
  );

  final output = await getExternalStorageDirectory();
  final file = File('${output!.path}/example_page.pdf');
  await file.writeAsBytes(await pdf.save());

  // Automatically open the PDF
  final result = await OpenFile.open(file.path);

  // Handle result
  // ignore: unnecessary_null_comparison
  if (result.message != null) {
    print('Failed to open PDF: ${result.message}');
  } else {
    print('PDF opened successfully.');
  }
}
