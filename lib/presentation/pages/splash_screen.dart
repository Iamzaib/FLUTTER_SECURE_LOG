// ignore_for_file: use_build_context_synchronously, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:securelog/data/model/daily_reports.dart';
import 'package:securelog/data/repositories/daily_report_services.dart';
import 'package:securelog/data/repositories/user_services.dart';
import 'package:securelog/presentation/controller/daily_reports.dart';
import 'package:securelog/presentation/controller/home.dart';
import 'package:securelog/routes.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    getAuth();
    super.initState();
  }

  getAuth() async {
    var res = await UserServices.getUser();
    if (res == -1) {
      return Get.offAllNamed(AppRoutes.appStartUp);
    }

    SharedPreferences sp = await SharedPreferences.getInstance();
    String? time = sp.getString('endtime');

    //UserServices.deleteUser(res);
    List<DailyReportNotes> lst = await DailyReportServices().getAllReports();
    if (lst.isNotEmpty) {
      Get.find<DailyReportsController>().setListDailyReports(lst);
      if (time != null && time != '') {
        if (DateTime.now().isBefore(DateTime.parse(time))) {
          if (lst.last.endTime == time) {
            // if (sp.getInt('version') == lst.last.version) {
            Get.find<DailyReportsController>().setDailyReport(lst.last);
            // }
          }
          Get.find<HomeController>().setUser(res);
          return Get.offNamed(AppRoutes.bottomNavBar);
        } else {
          Get.find<HomeController>().setUser(res);
          Get.find<DailyReportsController>().setSession(true);
          return Get.offNamed(AppRoutes.appEntry);
        }
      }
    }
    if (time == '' || time == null) {
      Get.find<HomeController>().setUser(res);
      return Get.offNamed(AppRoutes.appEntry);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: Image.asset(
            'assets/images/logo-transparent-png.png',
            // width: mediaQuery.size.width * .7,
          ),
        ),
      ),
    );
  }
}
