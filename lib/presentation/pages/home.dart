// ignore_for_file: use_build_context_synchronously, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:securelog/data/repositories/daily_report_services.dart';
import 'package:securelog/presentation/controller/daily_reports.dart';
import 'package:securelog/presentation/controller/home.dart';
import 'package:securelog/presentation/pages/appendices/appendices_drawer.dart';
import 'package:securelog/presentation/pages/log_info_list.dart';
import 'package:securelog/presentation/widgets/button.dart';
import 'package:securelog/presentation/widgets/new_log_entry.dart';
import 'package:securelog/presentation/widgets/show_snack_bar.dart';
import 'package:securelog/presentation/widgets/text.dart';
import 'package:securelog/presentation/widgets/text_field.dart';
import 'package:securelog/utilities.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../data/model/daily_reports.dart';
import '../../data/repositories/get_location_weather.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    getData();
    super.initState();
  }

  final _resetKey = GlobalKey<FormState>();
  final controller = Get.find<HomeController>();
  final dailyReportController = Get.find<DailyReportsController>();
  final String date = DateFormat.yMMMMd().format(DateTime.now());
  TextEditingController weatherController = TextEditingController();
  TextEditingController locationController = TextEditingController();
  TextEditingController notesController = TextEditingController();
  getData() async {
    if (!controller.isAppOpen) {
      controller.isAppOpen = true;
      if (controller.weather == '') {
        await getCurrentPosition(context);
      }

      if (controller.weather == '') {
        await showDialog(
            context: context,
            barrierDismissible: false,
            builder: (_) => AlertDialog(
                  title: myText("No Internet", controller.font),
                  content: SingleChildScrollView(
                    child: Form(
                      key: _resetKey,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          textField(weatherController, "Weather"),
                          const SizedBox(
                            height: 10,
                          ),
                          textField(locationController, "Location")
                        ],
                      ),
                    ),
                  ),
                  actions: [
                    InkWell(
                        onTap: () {
                          FormState? form = _resetKey.currentState;
                          if (form!.validate()) {
                            controller.weather = weatherController.text;
                            controller.location = locationController.text;
                            Navigator.pop(context);
                          }
                        },
                        child: myOutlinedButton('Save'))
                  ],
                ));
        controller.setWeather(controller.weather);
      } else {
        weatherController.text = controller.weather;
        locationController.text = controller.location;
      }
      if (dailyReportController.dailyReport != null) {
        if (dailyReportController.dailyReport!.notes != null) {
          notesController.text =
              dailyReportController.dailyReport!.notes.toString();
        }
      }
    } else {
      weatherController.text = controller.weather;
      locationController.text = controller.location;
      if (dailyReportController.dailyReport != null) {
        if (dailyReportController.dailyReport!.notes != null) {
          notesController.text =
              dailyReportController.dailyReport!.notes.toString();
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // floatingActionButton: FloatingActionButton(
        //   onPressed: () {
        //     if (dailyReportController.dailyReport != null) {
        //       Get.toNamed('/reportdetails',
        //           arguments: dailyReportController.dailyReport);
        //     } else {
        //       ScaffoldMessenger.of(context)
        //           .showSnackBar(snackBar("Enter Log or Notes", false));
        //     }
        //   },
        //   child: const Icon(Icons.email_outlined),
        // ),
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Text(
            "Security Log Book",
            style: TextStyle(fontFamily: controller.font),
          ),
        ),
        endDrawer: const Drawer(
          child: AppendicesDrawer(),
        ),
        body: GetBuilder<HomeController>(
            id: 'weather',
            builder: (con) {
              if (con.isweatherLoading) {
                return Column(children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.3,
                  ),
                  const Center(
                    child: CircularProgressIndicator(),
                  ),
                ]);
              }
              return SingleChildScrollView(
                child: Column(
                  children: [
                    ListView(shrinkWrap: true, children: [
                      Center(
                          child: myText(
                              controller.user.companyName, controller.font,
                              isBold: true)),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            myText(
                                "${controller.user.surName}${controller.user.firstName[0]}",
                                controller.font),
                            myText(date, controller.font)
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Flexible(
                            child: myText(
                                weatherController.text, controller.font)),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Flexible(
                            child: myText(
                                locationController.text, controller.font)),
                      ),
                      GetBuilder<HomeController>(
                          id: 'isexpandable',
                          builder: (cont) {
                            return Column(
                              children: [
                                controller.isExpandable
                                    ? Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Text(
                                              "Breifing notes:",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontFamily: controller.font),
                                            ),
                                          ),
                                          Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 8.0,
                                                  right: 8.0,
                                                  bottom: 8.0),
                                              child: GetBuilder<HomeController>(
                                                  id: 'isexpandable',
                                                  builder: (cont) {
                                                    return TextFormField(
                                                      keyboardType:
                                                          TextInputType
                                                              .multiline,
                                                      maxLines: controller
                                                              .isExpandable
                                                          ? null
                                                          : 1,
                                                      textInputAction:
                                                          TextInputAction.done,
                                                      controller:
                                                          notesController,
                                                      decoration:
                                                          InputDecoration(
                                                        filled: true,
                                                        fillColor: Colors.white,
                                                        hintText: "Enter Notes",
                                                        hintStyle: TextStyle(
                                                          color:
                                                              Colors.grey[600],
                                                        ),
                                                        focusedBorder:
                                                            const OutlineInputBorder(
                                                          borderSide:
                                                              BorderSide(
                                                            color: Colors.blue,
                                                            width: 2.0,
                                                          ),
                                                        ),
                                                      ),
                                                      onFieldSubmitted:
                                                          (e) async {
                                                        notesController.text =
                                                            e;

                                                        SharedPreferences sp =
                                                            await SharedPreferences
                                                                .getInstance();
                                                        if (dailyReportController
                                                                .dailyReport ==
                                                            null) {
                                                          DailyReportNotes
                                                              dailyReport =
                                                              DailyReportNotes(
                                                            dailyReportId: 0,
                                                            notes: e,
                                                            logs: [],
                                                            dateCreated:
                                                                sp.getString(
                                                                    'starttime'),
                                                            weather: controller
                                                                .weather,
                                                            company: controller
                                                                .user
                                                                .companyName,
                                                            location: controller
                                                                .location,
                                                            logo: controller
                                                                .user
                                                                .companyLogo,
                                                            endTime:
                                                                sp.getString(
                                                                    'endtime'),
                                                            // / version: sp.getInt('version')!
                                                          );
                                                          DailyReportServices()
                                                              .insertDailyReport(
                                                                  dailyReport)
                                                              .then((value) {
                                                            dailyReport
                                                                    .dailyReportId =
                                                                value;
                                                            ScaffoldMessenger
                                                                    .of(context)
                                                                .showSnackBar(
                                                                    snackBar(
                                                                        "Notes Saved",
                                                                        true));
                                                          });
                                                          dailyReportController
                                                              .setDailyReport(
                                                                  dailyReport);
                                                          dailyReportController
                                                              .lstdailyReport
                                                              .add(dailyReport);
                                                          List<DailyReportNotes>
                                                              templst =
                                                              dailyReportController
                                                                  .lstdailyReport;
                                                          dailyReportController
                                                              .setListDailyReports(
                                                                  templst);
                                                        } else {
                                                          List<DailyReportNotes>
                                                              templst = [];
                                                          for (DailyReportNotes dailyReportNotes
                                                              in dailyReportController
                                                                  .lstdailyReport) {
                                                            if (dailyReportNotes
                                                                    .dateCreated ==
                                                                sp.getString(
                                                                    'starttime')) {
                                                              dailyReportNotes
                                                                  .notes = e;
                                                            }
                                                            templst.add(
                                                                dailyReportNotes);
                                                          }

                                                          dailyReportController
                                                              .setListDailyReports(
                                                                  templst);
                                                          DailyReportServices()
                                                              .updateDailyReportNotes(templst
                                                                  .where((e) =>
                                                                      e.dateCreated ==
                                                                      sp.getString(
                                                                          'starttime'))
                                                                  .first)
                                                              .then((value) {
                                                            ScaffoldMessenger
                                                                    .of(context)
                                                                .showSnackBar(
                                                                    snackBar(
                                                                        "Notes Saved",
                                                                        true));
                                                          });
                                                        }
                                                      },
                                                    );
                                                  })),
                                        ],
                                      )
                                    : const Padding(padding: EdgeInsets.zero),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    InkWell(
                                        onTap: () {
                                          controller.setIsExpandable(
                                              !controller.isExpandable);
                                        },
                                        child: cont.isExpandable
                                            ? const Icon(Icons.expand_less)
                                            : const Icon(Icons.expand_more))
                                  ],
                                )
                              ],
                            );
                          })
                    ]),
                    const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Divider(
                        color: shadowColorDark,
                        thickness: 1,
                      ),
                    ),
                    InkWell(
                      onTap: () => _startNewLogEntry(context),
                      child: SizedBox(
                        height: MediaQuery.of(context).size.height * 0.5,
                        child: const Center(
                          child: LogInfoList(),
                        ),
                      ),
                    )
                  ],
                ),
              );
            }));
  }

  void _startNewLogEntry(BuildContext ctx) {
    showModalBottomSheet(
      context: ctx,
      builder: (_) {
        return const NewLogEntry();
      },
    );
  }
}
