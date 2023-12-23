import 'package:flutter/material.dart';

TextFormField textField(TextEditingController controller, String hint) {
  return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.white,
        hintText: hint,
        hintStyle: TextStyle(
          color: Colors.grey[600],
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.blue,
            width: 2.0,
          ),
        ),
      ),
      validator: (value) => value!.isEmpty ? '$hint is Empty' : null);
}
