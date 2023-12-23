import 'package:flutter/material.dart';

Text myText(String text, String font, {bool? isBold}) {
  return Text(
    text,
    style: TextStyle(
        fontFamily: font,
        fontWeight: isBold != null ? FontWeight.bold : FontWeight.normal),
  );
}
