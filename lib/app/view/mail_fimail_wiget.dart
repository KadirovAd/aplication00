import 'package:aplication000/app/constant/colors.dart';
import 'package:aplication000/app/constant/icons.dart';
import 'package:aplication000/app/widget/serrver/auth_server.dart';
import 'package:aplication000/app/widget/text_fild_widget/TextFild.dart';
import 'package:flutter/material.dart';

class BuildSignupSection extends StatefulWidget {
  const BuildSignupSection({
    Key? key,
    required this.emailControllerReg,
    required this.passwodControllerReg,
    required this.nameControllerReg,
  }) : super(key: key);

  final TextEditingController emailControllerReg;
  final TextEditingController passwodControllerReg;
  final TextEditingController nameControllerReg;

  @override
  _BuildSignupSectionState createState() => _BuildSignupSectionState();
}

class _BuildSignupSectionState extends State<BuildSignupSection> {
  bool isMale = true;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 20),
      child: Column(
        children: [
          CustomTextField(
              controller: widget.nameControllerReg,
              icon: Icons.person,
              hintText: "User Name",
              isPassword: false,
              isEmail: false),
          CustomTextField(
              controller: widget.emailControllerReg,
              icon: Icons.email,
              hintText: "email",
              isPassword: false,
              isEmail: true),
          CustomTextField(
              controller: widget.passwodControllerReg,
              icon: Icons.wallet,
              hintText: "password",
              isPassword: true,
              isEmail: false),
          Padding(
            padding: const EdgeInsets.only(top: 10, left: 10),
            child: Row(
              children: [
                GestureDetector(
                  onTap: () {
                    setState(() {
                      isMale = true;
                    });
                  },
                  child: Row(
                    children: [
                      Container(
                        width: 30,
                        height: 30,
                        margin: const EdgeInsets.only(right: 8),
                        decoration: BoxDecoration(
                          color: isMale
                              ? Palette.textColor2
                              : const Color.fromARGB(0, 255, 0, 0),
                          border: Border.all(
                            color: isMale
                                ? Colors.transparent
                                : Palette.textColor1,
                          ),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Icon(
                          MaterialCommunityIcons.account_outline,
                          color: isMale ? Colors.white : Palette.iconColor,
                        ),
                      ),
                      const Text(
                        "Male",
                        style: TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  width: 30,
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      isMale = false;
                    });
                  },
                  child: Row(
                    children: [
                      Container(
                        width: 30,
                        height: 30,
                        margin: const EdgeInsets.only(right: 8),
                        decoration: BoxDecoration(
                          color: !isMale
                              ? Palette.textColor2
                              : const Color.fromARGB(0, 255, 0, 0),
                          border: Border.all(
                            width: 1,
                            color: !isMale
                                ? Colors.transparent
                                : Palette.textColor1,
                          ),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Icon(
                          MaterialCommunityIcons.account_outline,
                          color: !isMale ? Colors.white : Palette.iconColor,
                        ),
                      ),
                      const Text(
                        "Female",
                        style: TextStyle(color: Palette.textColor1),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Container(
            width: 200,
            margin: const EdgeInsets.only(top: 20),
            child: RichText(
              textAlign: TextAlign.center,
              text: const TextSpan(
                text: "By pressing 'Submit' you agree to our ",
                style: TextStyle(color: Palette.textColor1),
                children: [
                  TextSpan(
                    text: "term & conditions",
                    style: TextStyle(color: Colors.blue),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          TextButton(
            style: const ButtonStyle(
                backgroundColor: MaterialStatePropertyAll(Colors.orange)),
            onPressed: () {
              Auth().registerWithEmailAndPassword(
                widget.emailControllerReg.text,
                widget.passwodControllerReg.text,
                widget.nameControllerReg.text,
                context,
              );
            },
            child: const Text(
              'Sing up',
              style: TextStyle(fontSize: 15, color: Colors.black),
            ),
          ),
        ],
      ),
    );
  }
}
