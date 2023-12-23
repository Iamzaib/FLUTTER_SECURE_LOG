// ignore_for_file: prefer_const_constructors, deprecated_member_use

import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:pdf/widgets.dart';
import 'package:securelog/data/model/daily_reports.dart';
import 'package:securelog/presentation/controller/daily_reports.dart';
import 'package:securelog/presentation/controller/home.dart';

pw.Document generatePdf(
    HomeController controller,
    DailyReportsController dailyReportsController,
    DailyReportNotes dailyReportNotes,
    BuildContext contxt) {
  final pdf = pw.Document();

  pdf.addPage(pw.MultiPage(
      footer: (context) => pw.Row(
          mainAxisAlignment: pw.MainAxisAlignment.end,
          children: [pw.Text(context.pageNumber.toString())]),
      pageFormat: PdfPageFormat.a4,
      build: (context) {
        return <pw.Widget>[
          pw.Column(
            crossAxisAlignment: pw.CrossAxisAlignment.start,
            children: [
              pw.Row(
                children: [
                  pw.SizedBox(
                    width: MediaQuery.of(contxt).size.width * 0.45,
                  ),
                  pw.ClipOval(
                      child: pw.Image(
                    pw.MemoryImage(
                      Uint8List.fromList(dailyReportNotes.logo!.codeUnits),
                    ),
                    width: 80,
                    height: 80,
                    fit: pw.BoxFit.cover,
                  )),
                  pw.SizedBox(
                    width: 10,
                  ),
                ],
              ),
              header(
                  controller, dailyReportsController, dailyReportNotes, contxt),
              pw.SizedBox(
                height: 10,
              ),
              pw.Divider(
                thickness: 2,
                color: PdfColors.black,
              ),
              pw.Row(
                children: [
                  pw.SizedBox(
                    width: 5,
                  ),
                  pw.Text(
                    "Time",
                    style: pw.TextStyle(
                      fontSize: 16,
                    ),
                  ),
                  pw.SizedBox(
                    width: MediaQuery.of(contxt).size.width * 0.3,
                  ),
                  pw.Text("Details"),
                ],
              ),
              pw.Divider(
                thickness: 2,
                color: PdfColors.black,
              ),
              pw.Container(
                height: 10,
              ),
              pw.ListView.builder(
                itemBuilder: (ctx, notesIndex) {
                  return pw.Column(
                    crossAxisAlignment: pw.CrossAxisAlignment.start,
                    children: [
                      pw.Row(
                        children: [
                          pw.Text(
                            "${dailyReportNotes.logs[notesIndex].timeCreated.toString()} |",
                            style: const pw.TextStyle(
                              fontSize: 16,
                            ),
                          ),
                          pw.SizedBox(
                            width: 30,
                          ),
                          dailyReportNotes.logs[notesIndex].isline!
                              ? pw.Flexible(
                                  child: pw.Text(
                                    dailyReportNotes.logs[notesIndex].log
                                        .toString(),
                                    style: pw.TextStyle(
                                        decoration: TextDecoration.lineThrough),
                                  ),
                                )
                              : pw.Flexible(
                                  child: pw.Text(dailyReportNotes
                                      .logs[notesIndex].log
                                      .toString()),
                                ),
                        ],
                      ),
                      pw.Padding(
                        padding: pw.EdgeInsets.all(8.0),
                        child: pw.Divider(
                          thickness: 1,
                        ),
                      )
                    ],
                  );
                },
                itemCount: dailyReportNotes.logs.length,
              ),
              pw.SizedBox(
                height: 10,
              ),
              pw.Column(
                crossAxisAlignment: pw.CrossAxisAlignment.start,
                mainAxisAlignment: pw.MainAxisAlignment.end,
                mainAxisSize: pw.MainAxisSize.max,
                children: [
                  signature(dailyReportNotes, contxt),
                  // pw.Row(
                  //   mainAxisAlignment: pw.MainAxisAlignment.end,
                  //   children: [
                  //     pw.Padding(
                  //       padding: pw.EdgeInsets.only(right: 10.0),
                  //       child: mytext("Page ", (index + 1).toString(), contxt),
                  //     ),
                  //   ],
                  // ),
                  // pw.Divider()
                ],
              ),
              pw.SizedBox(
                height: 15,
              ),
            ],
          )
        ];
      }));

  return pdf;
}

pw.Padding signature(DailyReportNotes dailyReportNotes, BuildContext context) {
  return pw.Padding(
    padding: pw.EdgeInsets.all(12.0),
    child: pw.Row(
      mainAxisAlignment: pw.MainAxisAlignment.start,
      children: [
        // mytext("Signature", "", context),
        pw.SizedBox(
            height: 100,
            child: pw.Image(pw.MemoryImage(convertStringToUint8List(
                Get.find<HomeController>().user.signature.toString())))),
      ],
    ),
  );
}

Uint8List convertStringToUint8List(String str) {
  final List<int> codeUnits = str.codeUnits;
  final Uint8List unit8List = Uint8List.fromList(codeUnits);

  return unit8List;
}

pw.Column header(
    HomeController homeController,
    DailyReportsController dailyReportsController,
    DailyReportNotes dailyReportNotes,
    BuildContext context,
    {int? logIndex}) {
  return pw.Column(
    crossAxisAlignment: pw.CrossAxisAlignment.start,
    children: [
      pw.Column(
        crossAxisAlignment: pw.CrossAxisAlignment.start,
        children: [
          mytext("Date: ", dailyReportNotes.dateCreated.toString(), context),
          mytext(
              "Name: ",
              "${homeController.user.surName.toString()}${homeController.user.firstName.toString().substring(0, 1)}",
              context),
          mytext("Weather: ", dailyReportNotes.weather.toString(), context),
          mytext("Location: ", dailyReportNotes.location.toString(), context),
        ],
      ),
      pw.SizedBox(
        height: 15,
      ),
      dailyReportNotes.notes != null
          ? dailyReportNotes.notes != ""
              ? pw.Column(
                  crossAxisAlignment: pw.CrossAxisAlignment.start,
                  children: [
                    pw.Text(
                      "Breifing notes:",
                      style: pw.TextStyle(fontWeight: FontWeight.bold),
                    ),
                    pw.SizedBox(
                      height: 5,
                    ),
                    pw.Text(
                      dailyReportNotes.notes.toString(),
                      softWrap: true,
                    ),
                  ],
                )
              : pw.Padding(padding: pw.EdgeInsets.zero)
          : pw.Padding(padding: pw.EdgeInsets.zero)
    ],
  );
}

pw.Text mytext(String title, String text, BuildContext context) {
  return pw.Text(
    "$title $text",
    style: pw.TextStyle(),
  );
}
