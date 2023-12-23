// ignore_for_file: use_build_context_synchronously

import 'dart:io';
import 'dart:typed_data';
import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:securelog/data/model/user.dart';
import 'package:securelog/data/repositories/user_services.dart';
import 'package:securelog/presentation/controller/home.dart';
import 'package:securelog/presentation/widgets/show_loader.dart';
import 'package:securelog/presentation/widgets/show_snack_bar.dart';
import 'package:securelog/routes.dart';
import 'package:securelog/utilities.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../widgets/text_field.dart';

class StartUpScreen extends StatefulWidget {
  const StartUpScreen({super.key});

  @override
  State<StartUpScreen> createState() => _StartUpScreenState();
}

class _StartUpScreenState extends State<StartUpScreen> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController firstName = TextEditingController();
  TextEditingController surName = TextEditingController();
  TextEditingController companyName = TextEditingController();
  TextEditingController location = TextEditingController();
  TextEditingController signature = TextEditingController();
  final controller = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColorLight,
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      SizedBox(
                          height: MediaQuery.of(context).size.height * 0.2,
                          child: Image.asset(
                              'assets/images/logo-transparent-png.png')),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8),
                        child: textField(firstName, 'First Name'),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8),
                        child: textField(surName, 'SurName'),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8),
                        child: textField(companyName, 'Company Name'),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8),
                        child: textField(location, 'Location'),
                      ),
                      btnCompanyLogo(),
                      chkSignature(signature),
                      InkWell(
                          onTap: () async {
                            Uint8List sign;
                            FormState? form = _formKey.currentState;
                            if (form!.validate()) {
                              showLoaderDialog(context, "Adding");
                              if (controller.companylogo == null) {
                                Navigator.pop(context);
                                ScaffoldMessenger.of(context).showSnackBar(
                                    snackBar("Select Company Logo", false));
                              } else if (controller.signature &&
                                  signature.text.isNotEmpty) {
                                sign = await _onPressedButton(signature.text);
                                User user = User(
                                    firstName: firstName.text,
                                    surName: surName.text,
                                    companyName: companyName.text,
                                    location: location.text,
                                    companyLogo: String.fromCharCodes(
                                        File(controller.companylogo!.path)
                                            .readAsBytesSync()),
                                    signature: String.fromCharCodes(sign));
                                var res = await UserServices.insertUser(user);
                                if (res.toString() != 'Error') {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                      snackBar(res.toString(), true));
                                  Navigator.pop(context);
                                  SharedPreferences sp =
                                      await SharedPreferences.getInstance();
                                  sp.setString('sign', signature.text);
                                  controller.setUser(user);
                                  Get.offAllNamed(AppRoutes.appEntry);
                                } else {
                                  Navigator.pop(context);

                                  ScaffoldMessenger.of(context).showSnackBar(
                                      snackBar(res.toString(), false));
                                }
                              } else {
                                User user = User(
                                    firstName: firstName.text,
                                    surName: surName.text,
                                    companyName: companyName.text,
                                    location: location.text,
                                    companyLogo: String.fromCharCodes(
                                        File(controller.companylogo!.path)
                                            .readAsBytesSync()),
                                    signature: "");
                                SharedPreferences sp =
                                    await SharedPreferences.getInstance();
                                sp.setString('sign', "");
                                var res = await UserServices.insertUser(user);
                                if (res.toString() != 'Error') {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                      snackBar(res.toString(), true));
                                  Navigator.pop(context);
                                  controller.setUser(user);
                                  Get.offAllNamed(AppRoutes.appEntry);
                                } else {
                                  Navigator.pop(context);

                                  ScaffoldMessenger.of(context).showSnackBar(
                                      snackBar(res.toString(), false));
                                }
                              }
                            } else {
                              Navigator.pop(context);
                            }
                          },
                          child: btnStartShift())
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Container btnStartShift() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        color: Colors.blue,
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
          "Start Shift?",
          style: TextStyle(color: containerColor),
        )),
      ),
    );
  }

  Padding chkSignature(TextEditingController signature) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: GetBuilder<HomeController>(
          id: 'signature',
          builder: (con) {
            return Column(
              children: [
                CheckboxListTile(
                    title: const Text("Include Signature?"),
                    value: con.signature,
                    onChanged: (v) {
                      con.setSignature(v!);
                    }),
                con.signature
                    ? textField(signature, "Signature")
                    : const Padding(padding: EdgeInsets.zero)
              ],
            );
          }),
    );
  }

  Padding btnCompanyLogo() {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
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
        child: InkWell(
          onTap: () async {
            XFile? img =
                await ImagePicker().pickImage(source: ImageSource.gallery);
            if (img != null) {
              File file = File(img.path);
              Get.find<HomeController>().setCompanylogo(file);
            }
          },
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: GetBuilder<HomeController>(
                id: 'companyLogo',
                builder: (con) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.image,
                        color:
                            con.companylogo != null ? greenColor : primaryColor,
                      ),
                      const SizedBox(width: 10.0),
                      Text(
                        con.companylogo == null
                            ? "Pick Company Logo"
                            : "Company Logo Picked",
                        style: TextStyle(
                          color: con.companylogo != null
                              ? greenColor
                              : primaryColor,
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold,
                        ),
                      )
                    ],
                  );
                }),
          ),
        ),
      ),
    );
  }

  Future<Uint8List> getCanvasImage(String str) async {
    var builder = ui.ParagraphBuilder(
        ui.ParagraphStyle(fontFamily: "Cursiv", fontSize: 15));
    builder.pushStyle(ui.TextStyle(color: Colors.black));
    builder.addText(str);

    ui.Paragraph paragraph = builder.build();
    paragraph.layout(const ui.ParagraphConstraints(width: 100));

    final recorder = ui.PictureRecorder();
    var newCanvas = Canvas(recorder);

    newCanvas.drawParagraph(paragraph, const Offset(10, 40));

    final picture = recorder.endRecording();
    var res = await picture.toImage(100, 100);
    ByteData? data = await res.toByteData(format: ui.ImageByteFormat.png);

    return Uint8List.view(data!.buffer);
  }

  Future<Uint8List> _onPressedButton(String text) async {
    return getCanvasImage(text);
  }
}
