// ignore_for_file: file_names

import 'package:aplication000/app/widget/serrver/auth_server.dart';
import 'package:aplication000/main.dart';
import 'package:flutter/material.dart';

class BuilBottomHaflContainer extends StatefulWidget {
  const BuilBottomHaflContainer(
      {Key? key,
      required this.top,
      required this.showShadow,
      required this.emailController,
      required this.passwodController,
      required this.emailControllerReg,
      required this.passwodControllerReg,
      required this.nameControllerReg})
      : super(key: key);
  final double top;
  final bool showShadow;

  final TextEditingController emailController;
  final TextEditingController passwodController;

  final TextEditingController emailControllerReg;
  final TextEditingController passwodControllerReg;
  final TextEditingController nameControllerReg;

  @override
  _BuilBottomHaflContainerState createState() =>
      _BuilBottomHaflContainerState();
}

class _BuilBottomHaflContainerState extends State<BuilBottomHaflContainer> {
  @override
  Widget build(BuildContext context) {
    return AnimatedPositioned(
      duration: const Duration(milliseconds: 700),
      curve: Curves.bounceInOut,
      top: widget.top,
      right: 0,
      left: 0,
      child: Center(
        child: Container(
          height: 90,
          width: 90,
          padding: const EdgeInsets.all(15),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(50),
            boxShadow: [
              if (widget.showShadow)
                BoxShadow(
                  color:
                      const Color.fromARGB(255, 239, 239, 238).withOpacity(.3),
                  spreadRadius: 1.5,
                  blurRadius: 10,
                ),
            ],
          ),
          child: !widget.showShadow
              ? InkWell(
                  onTap: () {
                    Auth().signInWithEmailAndPassword(
                        widget.emailController.text,
                        widget.passwodController.text,
                        context);
                    Auth().registerWithEmailAndPassword(
                      widget.emailControllerReg.text,
                      widget.emailControllerReg.text,
                      context,
                    );
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.amber,
                      borderRadius: BorderRadius.circular(30),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(.3),
                          spreadRadius: 1,
                          blurRadius: 2,
                          offset: const Offset(0, 1),
                        ),
                      ],
                    ),
                    child: const Icon(
                      Icons.arrow_forward,
                      color: Colors.white,
                    ),
                  ),
                )
              : null,
        ),
      ),
    );
  }
}