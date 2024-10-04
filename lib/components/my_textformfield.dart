import 'package:flutter/material.dart';


class MyTextFormField extends StatelessWidget {
  const MyTextFormField({
    super.key,
    required this.controller,
    required this.obscuretext,
    required this.labelText,
    required this.hintText,
  });

  final TextEditingController controller;
  final bool obscuretext;
  final String labelText;
  final String hintText;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: obscuretext,
      decoration: InputDecoration(
        label: Text(labelText),
        hintText: hintText,
        // hintStyle: const TextStyle(color: Colors.blue),
        contentPadding: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: Colors.grey,),
          gapPadding: 10,
          
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(
            color: Colors.blue,
          ),
          gapPadding: 10,
        ),
        floatingLabelBehavior: FloatingLabelBehavior.always,
      ),
    );
  }
}
