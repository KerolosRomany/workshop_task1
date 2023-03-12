
import 'package:flutter/material.dart';

Widget TextFieldComponent({
  required TextEditingController controller,
  TextInputType? keyType,
  required String label,
  Icon? picon,
  onTap,
  TextStyle? labelStyle,
  validator,
  IconButton? sicon,
  bool isPassword = false,
}) =>
    TextFormField(
      controller: controller,
      obscureText: isPassword,
      keyboardType: keyType,
      validator: validator,
      onTap: onTap,
      style: TextStyle(
        color: Colors.black,
      ),
      decoration: InputDecoration(
        labelText: label,
        labelStyle: labelStyle,
        prefixIcon: picon,
        suffixIcon: sicon != null ? sicon : null,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: BorderSide(
            width: 2.0,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: BorderSide(
            width: 2.0,
          ),
        ),
      ),
    );

Widget defaultButton({
  required String text,
  required onpressed,
  double? width_,
}) =>
    Container(
      width: width_ != null ? width_ : double.infinity,
      decoration: BoxDecoration(
        color: Colors.blue,
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: MaterialButton(
        child: Text(
          text,
          style: TextStyle(
              color: Colors.white,
              fontSize: 17
          ),
        ),
        onPressed: onpressed,
      ),
    );