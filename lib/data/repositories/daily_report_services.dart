import 'package:securelog/data/model/daily_reports.dart';
import 'package:securelog/data/repositories/database.dart';
import 'package:sqflite/sqflite.dart';

class DailyReportServices {
  Future<int?> insertDailyReport(DailyReportNotes dailyReport) async {
    Database db = await DbHelper.instance.database;
    int result = await db.insert('dailyReport', dailyReport.toMap());
    return result;
  }

  Future<int?> updateDailyReportNotes(DailyReportNotes dailyReport) async {
    Database db = await DbHelper.instance.database;
    int result = await db.update('dailyReport', dailyReport.toMap(),
        where: "dailyReportId=?", whereArgs: [dailyReport.dailyReportId]);
    return result;
  }

  Future<List<DailyReportNotes>> getAllReports() async {
    Database db = await DbHelper.instance.database;
    List<Map<String, dynamic>> allRows = await db.query('dailyReport');
    List<DailyReportNotes> allDailyReport = allRows
        .map((dailyReport) => DailyReportNotes.fromJson(dailyReport))
        .toList();

    return allDailyReport;
  }
}
