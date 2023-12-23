import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:securelog/presentation/controller/home.dart';
import 'package:securelog/routes.dart';

//import '../Bloc/DailyReportNotes/dailyreports_cubit.dart';

class AppendicesDrawer extends StatefulWidget {
  const AppendicesDrawer({super.key});

  @override
  State<AppendicesDrawer> createState() => _AppendicesDrawerState();
}

class _AppendicesDrawerState extends State<AppendicesDrawer> {
  Widget _buildListTile(String title, IconData icon, Function tapHandler) {
    return ListTile(
      leading: Icon(
        icon,
        size: 20,
      ),
      title: Text(
        title,
        style: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
      ),
      onTap: tapHandler as void Function()?,
    );
  }

  final controller = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Drawer(
        child: ListView(
          children: [
            Column(
              children: [
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 16.0, top: 16.0),
                      child: Container(
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.black),
                              borderRadius: BorderRadius.circular(99.0)),
                          child: const Icon(
                            Icons.person,
                            size: 80,
                          )),
                    ),
                    const SizedBox(
                      width: 15,
                    ),
                    Column(
                      children: [
                        const SizedBox(
                          height: 20,
                        ),
                        SizedBox(
                          height: 20,
                          width: 150,
                          child: ListView(
                            children: [
                              Text(
                                "Name:${controller.user.firstName.toString()} ${controller.user.surName.toString()}",
                                style: TextStyle(fontFamily: controller.font),
                              ),
                            ],
                          ),
                        )
                      ],
                    )
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                const Divider(
                  height: 0,
                )
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            // _buildListTile('Home', Icons.house, () {
            //   Get.toNamed(AppRoutes.bottomNavBar);
            // }),
            _buildListTile('Appendices Home Page', Icons.details, () {
              Get.toNamed(AppRoutes.appendices);
            }),
            _buildListTile('Note Taking', Icons.notes, () {
              Get.toNamed(AppRoutes.noteTaking);
            }),
            _buildListTile('Discription of Persons/Vehicles', Icons.person, () {
              Get.toNamed(AppRoutes.descriptionOfPerson);
            }),
            _buildListTile('Convertion table', Icons.compare, () {
              Get.toNamed(AppRoutes.conversionTable);
            }),
            // _buildListTile('10 Codes', Icons.code, () {
            //   Get.toNamed(AppRoutes.tenCodes);
            // }),
            _buildListTile('Phonetic alphabit', Icons.abc, () {
              Get.toNamed(AppRoutes.phonetic);
            }),
            _buildListTile('Patrols', Icons.person, () {
              Get.toNamed(AppRoutes.patrols);
            }),
            _buildListTile(
                'Fire prevention/observation', Icons.fire_extinguisher, () {
              Get.toNamed(AppRoutes.fireProvention);
            }),
            _buildListTile('WHIMIS', Icons.emergency, () {
              Get.toNamed(AppRoutes.whimis);
            }),
            _buildListTile('National Use of Force Framwork', Icons.verified,
                () {
              Get.toNamed(AppRoutes.nationalForceFramwork);
            }),
            _buildListTile('Power of Citizen Arrest', Icons.person, () {
              Get.toNamed(AppRoutes.citizenArrest);
            }),
            _buildListTile('First Aid', Icons.health_and_safety, () {
              Get.toNamed(AppRoutes.firstAid);
            }),
          ],
        ),
      ),
    );
  }
}
