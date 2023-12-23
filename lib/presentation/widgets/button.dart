import 'package:flutter/material.dart';
import 'package:securelog/utilities.dart';

Container myOutlinedButton(String text) {
  return Container(
    width: double.infinity,
    padding: const EdgeInsets.all(8.0),
    decoration: BoxDecoration(
      color: containerColor,
      border: Border.all(color: primaryColor),
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
    child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Center(
          child: Text(
        text,
        style: const TextStyle(color: primaryColor),
      )),
    ),
  );
}

Container myButton(String text) {
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
    child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Center(
          child: Text(
        text,
        style: const TextStyle(color: containerColor),
      )),
    ),
  );
}
