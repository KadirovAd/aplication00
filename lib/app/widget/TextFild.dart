import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatefulWidget {
  final IconData icon;
  final String hintText;
  final bool isPassword;
  final bool isEmail;

  const CustomTextField({
    Key? key,
    required this.icon,
    required this.hintText,
    this.isPassword = false,
    this.isEmail = false,
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

  // String? _emailValidator(String? value) {
  //   if (value == null || value.isEmpty) {
  //     return 'Please enter your email';
  //   } else if (!value.contains('@')) {
  //     return 'Please enter a valid email address';
  //   }
  // }

  // String? _passwordValidator(String? value) {
  //   if (value == null || value.isEmpty) {
  //     return 'Please enter your password';
  //   } else if (!value.contains(RegExp(''))) {
  //     return 'Password must contain letters';
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: TextFormField(
        // controller: _emailController,
        // validator: _emailValidator,
        obscureText: widget.isPassword,
        keyboardType:
            widget.isEmail ? TextInputType.emailAddress : TextInputType.text,
        decoration: InputDecoration(
          prefixIcon: Icon(
            widget.icon,
            color: Color.fromARGB(255, 118, 177, 255),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide:
                BorderSide(color: Colors.grey), // Updated to a default color
            borderRadius: BorderRadius.all(Radius.circular(35.0)),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide:
                BorderSide(color: Colors.blue), // Updated to a default color
            borderRadius: BorderRadius.all(Radius.circular(35.0)),
          ),
          contentPadding: EdgeInsets.all(10),
          hintText: widget.hintText,
          hintStyle: TextStyle(
              fontSize: 14, color: Colors.grey), // Updated to a default color
        ),
      ),
    );
  }
}
