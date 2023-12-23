// ignore_for_file: must_be_immutable, non_constant_identifier_names, use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:securelog/data/model/daily_reports.dart';
import 'package:securelog/data/repositories/daily_report_services.dart';
import 'package:securelog/presentation/controller/daily_reports.dart';
import 'package:securelog/presentation/controller/home.dart';
import 'package:securelog/presentation/widgets/show_snack_bar.dart';
import 'package:shared_preferences/shared_preferences.dart';

class NewLogEntry extends StatefulWidget {
  const NewLogEntry({super.key});

  @override
  State<NewLogEntry> createState() => _NewLogEntryState();
}

class _NewLogEntryState extends State<NewLogEntry> {
  final entryController = TextEditingController();

  void submitData() async {
    final enteredLog = entryController.text;
    if (enteredLog.isEmpty) {
      return;
    } else {
      final dailyReportController = Get.find<DailyReportsController>();
      final homeController = Get.find<HomeController>();
      SharedPreferences sp = await SharedPreferences.getInstance();
      String tempTime = DateTime.now().toString().split(' ')[1].split('.')[0];
      String Time = "${tempTime.split(':')[0]}:${tempTime.split(':')[1]}";
      Log log = Log(entryController.text, Time, 0, isline: false);
      if (dailyReportController.dailyReport == null) {
        DailyReportNotes dailyReport = DailyReportNotes(
          dailyReportId: 0,
          notes: "",
          logs: [log],
          dateCreated: sp.getString('starttime'),
          weather: homeController.weather,
          company: homeController.user.companyName,
          location: homeController.location,
          logo: homeController.user.companyLogo,
          endTime: sp.getString('endtime'),
          // version: sp.getInt('version')!
        );
        DailyReportServices().insertDailyReport(dailyReport).then((value) {
          dailyReport.dailyReportId = value;
          ScaffoldMessenger.of(context)
              .showSnackBar(snackBar("Log Added", true));
        });
        dailyReportController.setDailyReport(dailyReport);
        dailyReportController.lstdailyReport.add(dailyReport);
        List<DailyReportNotes> templst = dailyReportController.lstdailyReport;
        dailyReportController.setListDailyReports(templst);
      } else {
        List<DailyReportNotes> templst = [];
        for (DailyReportNotes dailyReportNotes
            in dailyReportController.lstdailyReport) {
          if (dailyReportNotes.dateCreated == sp.getString('starttime')) {
            dailyReportNotes.logs.add(log);
          }
          templst.add(dailyReportNotes);
        }

        dailyReportController.setListDailyReports(templst);
        DailyReportServices()
            .updateDailyReportNotes(templst
                .where((e) => e.dateCreated == sp.getString('starttime'))
                .first)
            .then((value) {
          ScaffoldMessenger.of(context)
              .showSnackBar(snackBar("Log Added", true));
        });
      }

      Navigator.of(context).pop();
      entryController.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    // final mediaQuery = MediaQuery.of(context);
    return Column(
      children: [
        TextField(
          textInputAction: TextInputAction.done,
          keyboardType: TextInputType.multiline,
          decoration: const InputDecoration(
            labelText: 'Enter log',
          ),
          controller: entryController,
          onSubmitted: (e) => submitData(),
        ),
      ],
    );
  }
}
