import 'package:aplication000/app/constant/colors.dart';
import 'package:aplication000/app/widget/serrver/auth_server.dart';
import 'package:aplication000/app/widget/text_fild_widget/TextFild.dart';
import 'package:flutter/material.dart';

class ConteinerSigninSection extends StatefulWidget {
  const ConteinerSigninSection({
    Key? key,
    required this.emailController,
    required this.passwodController,
  }) : super(key: key);
  final TextEditingController emailController;
  final TextEditingController passwodController;

  @override
  State<ConteinerSigninSection> createState() => _ConteinerSigninSectionState();
}

class _ConteinerSigninSectionState extends State<ConteinerSigninSection> {
  bool isRememberMe = false; // Move this line outside the build method

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 20),
      child: Column(
        children: [
          CustomTextField(
              controller: widget.emailController,
              icon: Icons.person,
              hintText: "email",
              isPassword: false,
              isEmail: true),
          CustomTextField(
              controller: widget.passwodController,
              icon: Icons.mail_outline,
              hintText: "pasword",
              isPassword: true,
              isEmail: false),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Checkbox(
                    value: isRememberMe,
                    activeColor: Palette.textColor2,
                    onChanged: (value) {
                      setState(() {
                        isRememberMe = !isRememberMe;
                      });
                    },
                  ),
                  const Text(
                    "Remember me",
                    style: TextStyle(
                        fontSize: 12, color: Color.fromARGB(255, 80, 188, 255)),
                  )
                ],
              ),
              TextButton(
                onPressed: () {},
                child: const Text(
                  "Forgot Password ?",
                  style: TextStyle(fontSize: 12, color: Palette.textColor1),
                ),
              )
            ],
          ),
          const SizedBox(
            height: 15,
          ),
          TextButton(
            style: const ButtonStyle(
                backgroundColor: MaterialStatePropertyAll(Colors.orange)),
            onPressed: () {
              Auth().signInWithEmailAndPassword(
                widget.emailController.text,
                widget.passwodController.text,
                context,
              );
            },
            child: const Text(
              'Sing in',
              style: TextStyle(fontSize: 15, color: Colors.black),
            ),
          ),
        ],
      ),
    );
  }
}
