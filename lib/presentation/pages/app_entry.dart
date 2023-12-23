// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:securelog/presentation/controller/daily_reports.dart';
import 'package:securelog/presentation/controller/home.dart';
import 'package:securelog/presentation/widgets/text.dart';
import 'package:securelog/routes.dart';
import 'package:securelog/utilities.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../widgets/button.dart';

class AppEntry extends StatefulWidget {
  const AppEntry({super.key});

  @override
  State<AppEntry> createState() => _AppEntryState();
}

class _AppEntryState extends State<AppEntry> {
  final controller = Get.find<HomeController>();
  final dailyReportsController = Get.find<DailyReportsController>();

  @override
  void didChangeDependencies() {
    checkSession();
    super.didChangeDependencies();
  }

  checkSession() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    if (dailyReportsController.sessionExpired) {
      showDialog(
          context: context,
          barrierDismissible: false,
          builder: (_) => AlertDialog(
                title: myText("Alert", controller.font),
                content: SingleChildScrollView(
                    child: myText("Session Expired", controller.font)),
                actions: [
                  InkWell(
                      onTap: () {
                        Navigator.pop(context);

                        sp.setString('starttime', '');
                        sp.setString('endtime', '');
                        dailyReportsController.setSession(false);
                      },
                      child: myOutlinedButton('Okay'))
                ],
              ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColorLight,
      body: SafeArea(
        child: Column(
          children: [
            Center(
              child: SizedBox(
                  height: MediaQuery.of(context).size.height * 0.2,
                  child: Image.asset('assets/images/logo-transparent-png.png')),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.1,
            ),
            InkWell(
              onTap: () async {
                // print(DateTime.now().toString());
                // String time =
                //     DateTime.now().add(const Duration(seconds: 1)).toString();
                // print(time);
                // if (DateTime.now().isBefore(DateTime.parse(time))) {
                //   print(DateTime.now());
                // }SharedPreferences sp = await SharedPreferences.getInstance();
                Get.find<DailyReportsController>().isSearch = false;
                Get.find<HomeController>().selectedScreen = 0;
                DateTime dateTime = DateTime.now();
                SharedPreferences sp = await SharedPreferences.getInstance();
                sp.setString('starttime', dateTime.toString());
                sp.setString('endtime',
                    dateTime.add(const Duration(minutes: 10)).toString());
                sp.setInt('version', 1);
                Get.offAllNamed(AppRoutes.bottomNavBar);
              },
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: myButton("Start Shift?"),
              ),
            ),
            InkWell(
              onTap: () async {
                Get.toNamed(AppRoutes.updateProfile);
              },
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: myOutlinedButton('Update'),
              ),
            ),
            InkWell(
              onTap: () {
                Get.find<DailyReportsController>().isSearch = true;
                Get.toNamed(AppRoutes.companyReports);
              },
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: btnSearch(),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Container btnSearch() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        color: containerColor,
        borderRadius: BorderRadius.circular(10.0),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: const Padding(
        padding: EdgeInsets.all(8.0),
        child: Center(
            child: Text(
          "Search",
          style: TextStyle(color: primaryColor),
        )),
      ),
    );
  }
}
