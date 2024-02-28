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
  // final _formKey = GlobalKey<FormState>();
  // final TextEditingController _emailController = TextEditingController();
  // final TextEditingController _passwordController = TextEditingController();

  // final FirebaseAuth _auth = FirebaseAuth.instance;

  // String? _emailError;
  // String? _passwordError;

  // Future<void> handleSubmit() async {
  //   setState(() {
  //     _emailError = null;
  //     _passwordError = null;
  //   });

  //   if (_formKey.currentState!.validate()) {
  //     try {
  //       final UserCredential user1 = await _auth.createUserWithEmailAndPassword(
  //           email: _emailController.text, password: _passwordController.text);
  //       final User? user = user1.user;
  //       ScaffoldMessenger.of(context).showSnackBar(
  //         SnackBar(
  //           content: Text('${user?.email}'),
  //         ),
  //       );
  //     } on FirebaseAuthException catch (e) {
  //       setState(() {});
  //     }
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: TextFormField(
        controller: widget.controller,
        // validator: _emailValidator,
        obscureText: widget.isPassword,
        keyboardType:
            widget.isEmail ? TextInputType.emailAddress : TextInputType.text,
        decoration: InputDecoration(
          prefixIcon: Icon(
            widget.icon,
            color: const Color.fromARGB(255, 118, 177, 255),
          ),
          enabledBorder: const OutlineInputBorder(
            borderSide:
                BorderSide(color: Colors.grey), // Updated to a default color
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
