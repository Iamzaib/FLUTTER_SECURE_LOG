import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:line_icons/line_icons.dart';
import 'package:securelog/presentation/controller/daily_reports.dart';
import 'package:securelog/presentation/controller/home.dart';
import 'package:securelog/presentation/pages/company_report.dart';
import 'package:securelog/presentation/pages/view_notes.dart';
import 'package:securelog/presentation/widgets/company_report_details.dart';

import '../widgets/show_snack_bar.dart';
import 'home.dart';

class BotttomNavBarScreen extends StatelessWidget {
  const BotttomNavBarScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<HomeController>();
    List<Widget> widgetOptions = <Widget>[
      const HomeScreen(),
      const ViewNotes(),
      const CompanyReportScreen(),
      DetailScreen()
    ];
    return Scaffold(
      body: GetBuilder<HomeController>(
          id: 'selectedScreen',
          builder: (con) {
            return widgetOptions[con.selectedScreen];
          }),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              blurRadius: 20,
              color: Colors.black.withOpacity(.1),
            )
          ],
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8),
            child: GetBuilder<HomeController>(
                id: 'selectedScreen',
                builder: (cont) {
                  return GNav(
                    selectedIndex: cont.selectedScreen,
                    rippleColor: Colors.grey[300]!,
                    hoverColor: Colors.grey[100]!,
                    gap: 8,
                    activeColor: Colors.black,
                    iconSize: 24,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 12),
                    duration: const Duration(milliseconds: 400),
                    tabBackgroundColor: Colors.blue[100]!,
                    color: Colors.black,
                    tabs: const [
                      GButton(
                        icon: LineIcons.home,
                        text: 'Home',
                      ),
                      GButton(
                        icon: Icons.assignment_outlined,
                        text: 'Notes',
                      ),
                      GButton(
                        icon: Icons.view_list_outlined,
                        text: 'Detail',
                      ),
                      GButton(
                        icon: Icons.email,
                        text: 'Email',
                      )
                    ],
                    onTabChange: (index) {
                      final dailyReportsController =
                          Get.find<DailyReportsController>();

                      if (index == 3) {
                        // Check the condition here, for example, if the daily report is not null
                        if (dailyReportsController.dailyReport != null) {
                          controller.setSelectedScreen(index);
                        } else {
                          // If the condition is not met, show a snackbar or handle the scenario as required.
                          ScaffoldMessenger.of(context).showSnackBar(
                              snackBar("Enter Log or Notes", false));

                          // Optionally, you can reset the selected screen to the previous one or any default screen.
                          // For example, to set the first screen as the default screen:
                          // controller.setSelectedScreen(0);
                        }
                      } else {
                        controller.setSelectedScreen(index);
                      }
                    },
                  );
                }),
          ),
        ),
      ),
    );
  }
}
