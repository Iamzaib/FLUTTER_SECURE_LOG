// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:securelog/presentation/controller/home.dart';
import 'package:weather/weather.dart';

Future<bool> handleLocationPermission(BuildContext context) async {
  bool serviceEnabled;
  LocationPermission permission;

  serviceEnabled = await Geolocator.isLocationServiceEnabled();
  if (!serviceEnabled) {
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text(
            'Location services are disabled. Please enable the services')));
    return false;
  }
  permission = await Geolocator.checkPermission();
  if (permission == LocationPermission.denied) {
    permission = await Geolocator.requestPermission();
    if (permission == LocationPermission.denied) {
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Location permissions are denied')));
      return false;
    }
  }
  if (permission == LocationPermission.deniedForever) {
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text(
            'Location permissions are permanently denied, we cannot request permissions.')));
    return false;
  }
  return true;
}

Future<String> getAddressFromLatLng(
    Position position, String currentLocation) async {
  await placemarkFromCoordinates(position.latitude, position.longitude)
      .then((List<Placemark> placemarks) {
    Placemark place = placemarks[0];
    Placemark place2 = placemarks[2];
    if (place.thoroughfare != null) {
      if (place.thoroughfare == "") {
        if (place2.street != place.subLocality) {
          currentLocation =
              "${place2.street},${placemarks[3].name},${place.locality},${place.administrativeArea}";
        } else {
          currentLocation =
              "${placemarks[3].name},${place.subLocality},${place.locality},${place.administrativeArea}";
        }
      } else {
        currentLocation =
            "${place.thoroughfare},${place.subLocality},${place.locality},${place.administrativeArea}";
      }
    }
  }).catchError((e) {
    debugPrint(e);
  });
  return currentLocation;
}

Future<void> getCurrentPosition(BuildContext context) async {
  final controller = Get.find<HomeController>();
  controller.isweatherLoading = true;
  WeatherFactory wf = WeatherFactory("7839e67319dc2b52fee25dbeaac1ea57");
  final hasPermission = await handleLocationPermission(context);
  if (!hasPermission) return;
  try {
    await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high)
        .timeout(const Duration(seconds: 1))
        .then((Position position) async {
      controller.location =
          await getAddressFromLatLng(position, controller.location);

      try {
        Weather w = await wf.currentWeatherByLocation(
            position.latitude, position.longitude);
        controller.setPosition(position);

        if (w.temperature != null) {
          controller.setWeather(
              "${w.weatherDescription} ${w.temperature!.celsius.toString().substring(0, 4)} C");
        }
      } catch (e) {
        controller.location = "";
        controller.weather = "";
        controller.setWeather("");
      }
    }).catchError((e) {
      debugPrint(e);
    });
  } catch (e) {
    controller.location = "";
    controller.weather = "";
  }
}
