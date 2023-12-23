// ignore_for_file: must_be_immutable

import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:securelog/data/repositories/daily_report_services.dart';
import 'package:securelog/presentation/controller/daily_reports.dart';
import 'package:securelog/presentation/controller/home.dart';

import '../../data/model/daily_reports.dart';

class LogInfoList extends StatelessWidget {
  const LogInfoList({super.key});

  @override
  Widget build(BuildContext context) {
    final curScaleFactor = MediaQuery.of(context).textScaleFactor;
    final mediaQuery = MediaQuery.of(context);
    return GetBuilder<DailyReportsController>(
        id: 'addlog',
        builder: (controller) {
          return Container(
            child: controller.lstdailyReport.isEmpty
                ? ListView(
                    shrinkWrap: true,
                    children: [
                      Image.asset(
                        'assets/images/logo-transparent-png.png',
                        width: mediaQuery.size.width * .8,
                      ),
                      Text(
                        'Tap to enter a Log.',
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                    ],
                  )
                : Stack(
                    children: [
                      Center(
                        child: Positioned(
                            child: ClipRRect(
                          borderRadius: BorderRadius.circular(99),
                          child: Container(
                            height: 150,
                            width: 150,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(99),
                            ),
                            child: ColorFiltered(
                              colorFilter: ColorFilter.mode(
                                  Colors.black.withOpacity(0.2),
                                  BlendMode.dstATop),
                              child: Image.memory(
                                Uint8List.fromList(Get.find<HomeController>()
                                    .user
                                    .companyLogo
                                    .codeUnits),
                                fit: BoxFit.fill,
                                gaplessPlayback: true,
                              ),
                            ),
                          ),
                        )),
                      ),
                      controller.dailyReport == null
                          ? const Center(
                              child: Text(
                                'Tap to enter a Log.',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 30),
                              ),
                            )
                          : ListView(
                              physics: const BouncingScrollPhysics(),
                              shrinkWrap: true,
                              children: [
                                ListView.builder(
                                    physics: const BouncingScrollPhysics(),
                                    shrinkWrap: true,
                                    itemCount:
                                        controller.dailyReport!.logs.length,
                                    itemBuilder: (context, notesIndex) {
                                      return Column(
                                        children: [
                                          logEntryItem(
                                              notesIndex,
                                              curScaleFactor,
                                              context,
                                              controller),
                                          const Divider(
                                            indent: 20,
                                            endIndent: 20,
                                            height: 0.8,
                                            thickness: 2,
                                          )
                                        ],
                                      );
                                    }),
                                const SizedBox(
                                  height: 140,
                                )
                              ],
                            ),
                    ],
                  ),
          );
        });
  }

  ListTile logEntryItem(int notesIndex, double curScaleFactor,
      BuildContext context, DailyReportsController controller) {
    return ListTile(
        leading: Text(
          "${controller.dailyReport!.logs[notesIndex].timeCreated.toString()} |",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16 * curScaleFactor,
          ),
        ),
        title: controller.dailyReport!.logs[notesIndex].isline!
            ? Text(
                controller.dailyReport!.logs[notesIndex].log.toString(),
                style: const TextStyle(decoration: TextDecoration.lineThrough),
              )
            : Text(controller.dailyReport!.logs[notesIndex].log.toString()),
        trailing: IconButton(
            onPressed: () async {
              controller.dailyReport!.logs[notesIndex].isline =
                  !controller.dailyReport!.logs[notesIndex].isline!;
              List<DailyReportNotes> templst = controller.lstdailyReport;
              await DailyReportServices()
                  .updateDailyReportNotes(controller.dailyReport!)
                  .then((value) {
                controller.setListDailyReports(templst);
              });
            },
            icon: controller.dailyReport!.logs[notesIndex].isline!
                ? const Icon(
                    Icons.cancel,
                    color: Colors.grey,
                  )
                : const Icon(
                    Icons.edit,
                    color: Colors.grey,
                  )));
  }
}
