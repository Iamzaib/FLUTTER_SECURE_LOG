// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:securelog/presentation/controller/daily_reports.dart';
import 'package:securelog/presentation/controller/home.dart';

Padding NotesContainer(
    DailyReportsController reportsController, int index, BuildContext context) {
  String startTime =
      reportsController.lstdailyReport[index].dateCreated.toString();
  String endTime = reportsController.lstdailyReport[index].endTime.toString();
  return reportsController.lstdailyReport[index].notes == ""
      ? const Padding(padding: EdgeInsets.zero)
      : Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      offset: const Offset(0, 4),
                      blurRadius: 7,
                      spreadRadius: 1)
                ]),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        "Briefing Notes:",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            fontFamily: Get.find<HomeController>().font),
                      ),
                      const SizedBox(
                        width: 100,
                      ),
                      Flexible(
                        child: Text(
                          "${startTime.split('.')[0].split(':')[0]}:${startTime.split('.')[0].split(':')[1]}-${endTime.split(' ')[1].split(':')[0]}:${endTime.split(' ')[1].split(':')[1]}",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              fontFamily: Get.find<HomeController>().font),
                        ),
                      ),
                    ],
                  ),
                  Text(
                    reportsController.lstdailyReport[index].notes.toString(),
                    style:
                        TextStyle(fontFamily: Get.find<HomeController>().font),
                  ),
                ],
              ),
            ),
          ),
        );
}
