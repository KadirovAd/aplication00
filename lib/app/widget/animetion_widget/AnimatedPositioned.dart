// ignore_for_file: prefer_const_constructors, file_names

import 'package:flutter/material.dart';

class Animation extends StatelessWidget {
  const Animation({
    super.key,
    required this.isSignupScreen,
    required this.showShadow,
  });

  final bool isSignupScreen;
  final bool showShadow;

  @override
  Widget build(BuildContext context) {
    return AnimatedPositioned(
      duration: Duration(milliseconds: 700),
      curve: Curves.bounceInOut,
      top: isSignupScreen ? 535 : 430,
      right: 0,
      left: 0,
      child: Center(
        child: Container(
          height: 90,
          width: 90,
          padding: EdgeInsets.all(15),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(50),
            boxShadow: [
              if (showShadow)
                BoxShadow(
                  color: Color.fromARGB(255, 246, 255, 0).withOpacity(.3),
                  spreadRadius: 1.5,
                  blurRadius: 10,
                ),
            ],
          ),
          child: !showShadow
              ? Container(
                  decoration: BoxDecoration(
                    color: Colors.amber,
                    borderRadius: BorderRadius.circular(30),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(.3),
                        spreadRadius: 1,
                        blurRadius: 2,
                        offset: Offset(0, 1),
                      ),
                    ],
                  ),
                  child: Icon(
                    Icons.arrow_forward,
                    color: Colors.white,
                  ),
                )
              : null,
        ),
      ),
    );
  }
}
