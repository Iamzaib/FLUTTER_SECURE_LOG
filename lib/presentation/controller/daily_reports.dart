// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:get/get.dart';
import 'package:securelog/data/model/daily_reports.dart';

class DailyReportsController extends GetxController {
  DailyReportNotes? _dailyReport;
  var _lstdailyReport = <DailyReportNotes>[];
  var _lstTempdailyReport = <DailyReportNotes>[];
  bool sessionExpired = false;
  bool isSearch = false;
  bool isSearchDate = true;

  DailyReportNotes? get dailyReport => _dailyReport;
  List<DailyReportNotes> get lstdailyReport => _lstdailyReport;
  List<DailyReportNotes> get lstTempdailyReport => _lstTempdailyReport;

  setIsSearchDate(bool v) {
    isSearchDate = v;
    update(['issearchdate']);
  }

  setListDailyReports(List<DailyReportNotes> lst) {
    _lstdailyReport = lst;
    _lstTempdailyReport = lst;
    update(['addlog']);
  }

  setListTempDailyReports(String value) {
    print(value);
    if (isSearchDate) {
      if (value.isNotEmpty) {
        _lstTempdailyReport = _lstdailyReport
            .where(
              (element) => element.dateCreated
                  .toString()
                  .toLowerCase()
                  .contains(value.toLowerCase()),
            )
            .toList();
      } else {
        _lstTempdailyReport = _lstdailyReport;
      }
    } else {
      if (value.isNotEmpty) {
        _lstTempdailyReport = _lstdailyReport
            .where(
              (element) => element.location
                  .toString()
                  .toLowerCase()
                  .contains(value.toLowerCase()),
            )
            .toList();
      } else {
        _lstTempdailyReport = _lstdailyReport;
      }
    }

    update(['changelist']);
  }

  setSession(bool v) {
    sessionExpired = v;
  }

  setDailyReport(DailyReportNotes? report) {
    _dailyReport = report;
  }
}
