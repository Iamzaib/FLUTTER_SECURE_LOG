import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:securelog/presentation/controller/daily_reports.dart';
import 'package:securelog/presentation/controller/home.dart';
import 'package:securelog/presentation/widgets/notes_card.dart';

class ViewNotes extends StatelessWidget {
  const ViewNotes({super.key});
  @override
  Widget build(BuildContext context) {
    final controller = Get.find<HomeController>();
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "View Briefing Notes",
          style: TextStyle(fontFamily: controller.font),
        ),
      ),
      body: GetBuilder<DailyReportsController>(builder: (con) {
        return ListView.builder(
          shrinkWrap: true,
          itemCount: con.lstdailyReport.length,
          itemBuilder: (context, index) => NotesContainer(con, index, context),
        );
      }),
    );
  }
}
