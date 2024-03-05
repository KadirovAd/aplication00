// ignore_for_file: file_names

import 'package:flutter/material.dart';

class CustomTextField extends StatefulWidget {
  final IconData icon;
  final String hintText;
  final bool isPassword;
  final bool isEmail;
  final TextEditingController controller;
  const CustomTextField({
    Key? key,
    required this.icon,
    required this.hintText,
    this.isPassword = false,
    this.isEmail = false,
    required this.controller,
  }) : super(key: key);

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: TextFormField(
        controller: widget.controller,
        obscureText: widget.isPassword,
        keyboardType:
            widget.isEmail ? TextInputType.emailAddress : TextInputType.text,
        decoration: InputDecoration(
          prefixIcon: Icon(
            widget.icon,
            color: const Color.fromARGB(255, 118, 177, 255),
          ),
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(
                color:
                    Color.fromARGB(255, 0, 0, 0)), // Updated to a default color
            borderRadius: BorderRadius.all(Radius.circular(35.0)),
          ),
          focusedBorder: const OutlineInputBorder(
            borderSide:
                BorderSide(color: Colors.blue), // Updated to a default color
            borderRadius: BorderRadius.all(Radius.circular(35.0)),
          ),
          contentPadding: const EdgeInsets.all(10),
          hintText: widget.hintText,
          hintStyle: const TextStyle(
              fontSize: 14, color: Colors.grey), // Updated to a default color
        ),
      ),
    );
  }
}
