// ignore_for_file: prefer_typing_uninitialized_variables

import 'dart:io';

import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:securelog/data/model/user.dart';

class HomeController extends GetxController {
  bool _signature = false;
  File? _companylogo;
  var _user;
  String signatureFont = 'Cursiv';
  String font = 'OpenDyslexic';
  String location = '';
  String weather = '';
  var _position;
  bool isweatherLoading = true;
  int selectedScreen = 0;
  bool isCompanyLogo = false;
  bool isExpandable = false;
  bool isAppOpen = false;

  File? get companylogo => _companylogo;
  bool get signature => _signature;
  User get user => _user;
  Position get position => _position;

  setSelectedScreen(int i) {
    selectedScreen = i;
    update(['selectedScreen']);
  }

  setIsExpandable(bool v) {
    isExpandable = v;
    update(['isexpandable']);
  }

  setPosition(Position position) {
    _position = position;
  }

  setWeather(String w) {
    weather = w;
    isweatherLoading = false;
    update(['weather']);
  }

  setCompanylogo(File companylogo) {
    _companylogo = companylogo;
    update(['companyLogo']);
  }

  setSignature(bool sign) {
    _signature = sign;
    update(['signature']);
  }

  setUser(User user) {
    _user = user;
  }
}
