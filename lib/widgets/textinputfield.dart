import 'package:flutter/material.dart';
import 'package:tiktok_clone/constant.dart';
class TextInputField extends StatelessWidget {
  const TextInputField({Key? key,
  required this.controller,
  required this.text,
  required this.icon,
  required this.isObscure,
  }) : super(key: key);
  final TextEditingController controller;
  final IconData icon;
  final String? text;
  final bool isObscure;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        prefixIcon: Icon(icon),
        prefixIconColor: Colors.white,
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide: BorderSide(
            color: borderColor,
          )
        ),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
            borderSide: BorderSide(
              color: borderColor,
            )
        ),
        labelText: text,
        labelStyle: TextStyle(color:Colors.white),
      ),
      style: TextStyle(color: Colors.white),
      controller:controller ,
      obscureText: isObscure,
    );
  }
}
