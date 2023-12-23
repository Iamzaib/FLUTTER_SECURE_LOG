// ignore_for_file: must_be_immutable, use_build_context_synchronously

import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';
import 'package:securelog/data/model/daily_reports.dart';
import 'package:securelog/data/repositories/daily_report_services.dart';
import 'package:securelog/presentation/controller/daily_reports.dart';
import 'package:securelog/presentation/controller/home.dart';
import 'package:securelog/presentation/widgets/button.dart';
import 'package:securelog/presentation/widgets/report_pdf.dart';
import 'package:securelog/presentation/widgets/show_loader.dart';
import 'package:securelog/presentation/widgets/show_snack_bar.dart';
import 'package:securelog/routes.dart';

class DetailScreen extends StatelessWidget {
  DetailScreen({Key? key, this.tempdate}) : super(key: key);

  final String date = DateFormat.yMMMMd().format(DateTime.now());

  String? tempdate;
  @override
  Widget build(BuildContext context) {
    GlobalKey key = GlobalKey();
    final controller = Get.find<HomeController>();
    final dailyReportsController = Get.find<DailyReportsController>();
    DailyReportNotes dailyReportNotes = Get.arguments == null
        ? Get.find<DailyReportsController>().dailyReport!
        : Get.arguments as DailyReportNotes;

    return Scaffold(
      key: key,
      appBar: AppBar(
        title: Text(
          "Detail Page",
          style: TextStyle(fontFamily: controller.font),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              GetBuilder<DailyReportsController>(builder: (con) {
                return ListView(
                  shrinkWrap: true,
                  physics: const BouncingScrollPhysics(),
                  children: [
                    Row(
                      children: [
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.35,
                        ),
                        CircleAvatar(
                          radius: 40,
                          backgroundImage: MemoryImage(
                            Uint8List.fromList(
                                dailyReportNotes.logo!.codeUnits),
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                      ],
                    ),
                    header(controller, con, dailyReportNotes, context),
                    const SizedBox(
                      height: 10,
                    ),
                    const Divider(
                      thickness: 2,
                      color: Colors.black,
                    ),
                    Row(
                      children: [
                        const SizedBox(
                          width: 5,
                        ),
                        const Text(
                          "Time",
                          style: TextStyle(
                            fontSize: 16,
                          ),
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.3,
                        ),
                        const Text("Details"),
                      ],
                    ),
                    const Divider(
                      thickness: 2,
                      color: Colors.black,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    ListView.builder(
                      physics: const BouncingScrollPhysics(),
                      shrinkWrap: true,
                      itemBuilder: (ctx, notesIndex) {
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Text(
                                  "${dailyReportNotes.logs[notesIndex].timeCreated.toString()} |",
                                  style: const TextStyle(
                                    fontSize: 16,
                                  ),
                                ),
                                const SizedBox(
                                  width: 30,
                                ),
                                dailyReportNotes.logs[notesIndex].isline!
                                    ? Flexible(
                                        child: Text(
                                          dailyReportNotes.logs[notesIndex].log
                                              .toString(),
                                          style: const TextStyle(
                                              decoration:
                                                  TextDecoration.lineThrough),
                                        ),
                                      )
                                    : Flexible(
                                        child: Text(dailyReportNotes
                                            .logs[notesIndex].log
                                            .toString()),
                                      ),
                              ],
                            ),
                            const Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Divider(
                                thickness: 1,
                              ),
                            )
                          ],
                        );
                      },
                      itemCount: dailyReportNotes.logs.length,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        signature(dailyReportNotes, context),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(right: 10.0),
                              child: mytext("", (1).toString(), context),
                            ),
                          ],
                        ),
                        const Divider()
                      ],
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                  ],
                );
              }),
              InkWell(
                  onTap: () async {
                    showLoaderDialog(context, "Generating..");

                    await getPdf(context, controller, dailyReportsController,
                        dailyReportNotes, context);

                    Navigator.pop(context);

                    if (!dailyReportsController.isSearch) {
                      DateTime dateTime = DateTime.now();
                      dailyReportsController.lstdailyReport.last.endTime =
                          dateTime.toString();
                      DailyReportServices().updateDailyReportNotes(
                          dailyReportsController.lstdailyReport.last);
                      Get.offAllNamed(AppRoutes.appEntry);
                    }
                  },
                  child: myButton("Generate PDF"))
            ],
          ),
        ),
      ),
    );
  }

  Column header(
      HomeController homeController,
      DailyReportsController dailyReportsController,
      DailyReportNotes dailyReportNotes,
      BuildContext context,
      {int? logIndex}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            mytext("Date: ",
                dailyReportNotes.dateCreated.toString().split(' ')[0], context),
            mytext(
                "Name: ",
                "${homeController.user.surName.toString()}${homeController.user.firstName.toString().substring(0, 1)}",
                context),
            mytext("Weather: ", dailyReportNotes.weather.toString(), context),
            mytext("Location: ", dailyReportNotes.location.toString(), context),
          ],
        ),
        const SizedBox(
          height: 15,
        ),
        dailyReportNotes.notes != null
            ? dailyReportNotes.notes != ""
                ? Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Breifing notes:",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        dailyReportNotes.notes.toString(),
                        softWrap: true,
                      ),
                    ],
                  )
                : const Padding(padding: EdgeInsets.zero)
            : const Padding(padding: EdgeInsets.zero),
      ],
    );
  }

  Padding signature(DailyReportNotes dailyReportNotes, BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Get.find<HomeController>().user.signature != ""
          ? Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                // mytext("Signature", "", context),
                SizedBox(
                    height: 100,
                    child: Image.memory(
                      convertStringToUint8List(
                          Get.find<HomeController>().user.signature.toString()),
                      fit: BoxFit.fill,
                    )),
              ],
            )
          : const Padding(padding: EdgeInsets.zero),
    );
  }

  Text mytext(String title, String text, BuildContext context) {
    return Text(
      "$title $text",
      style: TextStyle(fontFamily: Get.find<HomeController>().font),
    );
  }

  Uint8List convertStringToUint8List(String str) {
    final List<int> codeUnits = str.codeUnits;
    final Uint8List unit8List = Uint8List.fromList(codeUnits);

    return unit8List;
  }

  Future getPdf(
      BuildContext context,
      HomeController controller,
      DailyReportsController dailyReportsController,
      DailyReportNotes dailyReportNotes,
      BuildContext contxt) async {
    var pdf = generatePdf(
        controller, dailyReportsController, dailyReportNotes, contxt);

    DateTime dateTime = DateTime.now();
    List<int> bytes = await pdf.save();
    final path = (await getExternalStorageDirectory())!.path;
    File pdfFile = File(
        "$path/${dateTime.toString()} ${Get.find<HomeController>().user.surName}${Get.find<HomeController>().user.firstName[0]} shiftreport.pdf");

    await pdfFile.writeAsBytes(bytes, flush: true);
    await OpenFile.open(
        "$path/${dateTime.toString()} ${Get.find<HomeController>().user.surName}${Get.find<HomeController>().user.firstName[0]} shiftreport.pdf");
    // SharedPreferences sp = await SharedPreferences.getInstance();
    // sp.setInt('version', dailyReportNotes.version += 1);
    dailyReportsController.setDailyReport(null);
    ScaffoldMessenger.of(context).showSnackBar(snackBar("PDF Generated", true));
  }

  ListTile logEntryItem(int index, int notesIndex, BuildContext context,
      DailyReportsController state, DailyReportNotes dailyReportNotes) {
    return ListTile(
      leading: Text(
        "${dailyReportNotes.logs[notesIndex].timeCreated.toString()} |",
        style: const TextStyle(
          fontSize: 16,
        ),
      ),
      title: dailyReportNotes.logs[notesIndex].isline!
          ? Text(
              dailyReportNotes.logs[notesIndex].log.toString(),
              style: const TextStyle(decoration: TextDecoration.lineThrough),
            )
          : Text(dailyReportNotes.logs[notesIndex].log.toString()),
    );
  }
}
