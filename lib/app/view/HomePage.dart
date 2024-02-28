// ignore_for_file: unused_field, use_build_context_synchronously, unused_catch_clause, library_private_types_in_public_api, file_names

import 'package:aplication000/app/constant/colors.dart';
import 'package:aplication000/app/view/widget/builBottomHaflContainer.dart';
import 'package:aplication000/app/view/widget/build_signin_section.dart';
import 'package:aplication000/app/view/widget/build_signup_section.dart';
import 'package:flutter/material.dart';

class LoginSignupScreen extends StatefulWidget {
  const LoginSignupScreen({super.key});

  @override
  _LoginSignupScreenState createState() => _LoginSignupScreenState();
}

class _LoginSignupScreenState extends State<LoginSignupScreen> {
  bool isSignupScreen = true;
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailControllerRegister =
      TextEditingController();
  final TextEditingController _passwordControllerRegister =
      TextEditingController();
  final TextEditingController _userNameController = TextEditingController();

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Palette.backgroundColor,
      body: Stack(
        children: [
          Positioned(
            top: 0,
            right: 0,
            left: 0,
            child: SizedBox(
              height: 300,
              child: Container(
                padding: const EdgeInsets.only(top: 90, left: 20),
                color: const Color(0xFF3b5999).withOpacity(.85),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    RichText(
                      text: TextSpan(
                          text: "Welcome to",
                          style: TextStyle(
                            fontSize: 25,
                            letterSpacing: 2,
                            color: Colors.yellow[700],
                          ),
                          children: [
                            TextSpan(
                              text: isSignupScreen ? " Sebep," : " Back,",
                              style: TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.bold,
                                color: Colors.yellow[700],
                              ),
                            )
                          ]),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      isSignupScreen
                          ? " Sign up  yuer pasword  "
                          : "Log in yuer pasword  ",
                      style: const TextStyle(
                        letterSpacing: 1,
                        color: Colors.white,
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
          BuilBottomHaflContainer(
            emailController: emailController,
            emailControllerReg: _emailControllerRegister,
            nameControllerReg: _userNameController,
            passwodController: passwordController,
            passwodControllerReg: _passwordControllerRegister,
            showShadow: true,
            top: isSignupScreen ? 535 : 430,
          ),
          AnimatedPositioned(
            duration: const Duration(milliseconds: 700),
            curve: Curves.bounceInOut,
            top: isSignupScreen ? 200 : 230,
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 700),
              curve: Curves.bounceInOut,
              height: isSignupScreen ? 380 : 250,
              padding: const EdgeInsets.all(20),
              width: MediaQuery.of(context).size.width - 40,
              margin: const EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.3),
                    blurRadius: 15,
                    spreadRadius: 5,
                  ),
                ],
              ),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              isSignupScreen = false;
                            });
                          },
                          child: Column(
                            children: [
                              Text(
                                "Log in",
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: !isSignupScreen
                                      ? Palette.activeColor
                                      : Palette.textColor1,
                                ),
                              ),
                              if (!isSignupScreen)
                                Container(
                                  margin: const EdgeInsets.only(top: 3),
                                  height: 2,
                                  width: 55,
                                  color: Colors.orange,
                                )
                            ],
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              isSignupScreen = true;
                            });
                          },
                          child: Column(
                            children: [
                              Text(
                                "Sign up",
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: isSignupScreen
                                      ? Palette.activeColor
                                      : Palette.textColor1,
                                ),
                              ),
                              if (isSignupScreen)
                                Container(
                                  margin: const EdgeInsets.only(top: 3),
                                  height: 2,
                                  width: 55,
                                  color: Colors.orange,
                                )
                            ],
                          ),
                        )
                      ],
                    ),
                    if (isSignupScreen)
                      BuildSignupSection(
                        nameControllerReg: _userNameController,
                        emailControllerReg: _emailControllerRegister,
                        passwodControllerReg: _passwordControllerRegister,
                      ),
                    if (!isSignupScreen)
                      ConteinerSigninSection(
                        emailController: emailController,
                        passwodController: passwordController,
                      ),
                  ],
                ),
              ),
            ),
          ),
          BuilBottomHaflContainer(
            emailController: emailController,
            emailControllerReg: _emailControllerRegister,
            nameControllerReg: _userNameController,
            passwodController: passwordController,
            passwodControllerReg: _passwordControllerRegister,
            showShadow: false,
            top: isSignupScreen ? 535 : 430,
          ),
        ],
      ),
    );
  }
}
