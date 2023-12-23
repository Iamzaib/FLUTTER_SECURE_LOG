import 'dart:typed_data';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:securelog/presentation/controller/daily_reports.dart';
import 'package:securelog/presentation/controller/home.dart';
import 'package:securelog/presentation/widgets/show_snack_bar.dart';
import 'package:securelog/presentation/widgets/text.dart';
import 'package:securelog/utilities.dart';

class CompanyReportScreen extends StatelessWidget {
  const CompanyReportScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<HomeController>();
    final reportsController = Get.find<DailyReportsController>();

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Reports",
          style: TextStyle(fontFamily: controller.font),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // CircleAvatar(
                //   radius: 40,
                //   backgroundImage: MemoryImage(
                //     Uint8List.fromList(controller.user.companyLogo.codeUnits),
                //   ),
                // ),
                // const SizedBox(width: 16),
                Text(
                  controller.user.companyName,
                  style: TextStyle(
                    fontFamily: controller.font,
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.75,
                  child: CupertinoSearchTextField(
                    onChanged: (value) =>
                        reportsController.setListTempDailyReports(value),
                  ),
                ),
                const SizedBox(width: 10),
                InkWell(
                  onTap: () {
                    showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                              title:
                                  myText("Choose Search Type", controller.font),
                              content: SingleChildScrollView(
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    InkWell(
                                      onTap: () {
                                        reportsController.setIsSearchDate(true);
                                        Navigator.pop(context);
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(snackBar(
                                                "Date Selected", true));
                                      },
                                      child: Row(
                                        children: [
                                          const Icon(Icons.done),
                                          const SizedBox(
                                            width: 10,
                                          ),
                                          myText("Date", controller.font),
                                        ],
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    InkWell(
                                      onTap: () {
                                        reportsController
                                            .setIsSearchDate(false);
                                        Navigator.pop(context);
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(snackBar(
                                                "Location Selected", true));
                                      },
                                      child: Row(
                                        children: [
                                          const Icon(Icons.done),
                                          const SizedBox(
                                            width: 10,
                                          ),
                                          myText("Location", controller.font),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ));
                  },
                  child: Container(
                      decoration: BoxDecoration(
                          color: primaryColor,
                          borderRadius: BorderRadius.circular(99.0)),
                      child: const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Icon(
                          Icons.filter_list_outlined,
                          color: containerColor,
                        ),
                      )),
                )
              ],
            ),
            const Divider(
              thickness: 2,
            ),
            GetBuilder<DailyReportsController>(
                id: 'changelist',
                builder: (cont) {
                  return Expanded(
                    child: ListView.builder(
                        itemCount: reportsController.lstTempdailyReport.length,
                        itemBuilder: (context, index) {
                          String startTime = reportsController
                              .lstTempdailyReport[index].dateCreated
                              .toString();
                          String endTime = reportsController
                              .lstTempdailyReport[index].endTime
                              .toString();
                          return InkWell(
                            onTap: () {
                              Get.toNamed('/reportdetails',
                                  arguments: reportsController
                                      .lstTempdailyReport[index]);
                            },
                            child: Column(
                              children: [
                                ListTile(
                                  leading: const Icon(
                                    Icons.assignment,
                                    color: primaryColor,
                                  ),
                                  title: myText(
                                      "${startTime.split('.')[0].split(':')[0]}:${startTime.split('.')[0].split(':')[1]}-${endTime.split(' ')[1].split(':')[0]}:${endTime.split(' ')[1].split(':')[1]}",
                                      controller.font),
                                  // subtitle: myText(
                                  //     "Version: ${reportsController.lstTempdailyReport[index].version.toString()}",
                                  //     controller.font),
                                ),
                                const Divider(
                                  thickness: 1,
                                ),
                              ],
                            ),
                          );
                        }),
                  );
                }),
          ],
        ),
      ),
    );
  }
}
