import 'package:aplication000/main.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Auth {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<void> registerWithEmailAndPassword(
      String email, String password, BuildContext context) async {
    try {
      await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const AppText()),
      );
    } on FirebaseAuthException catch (e) {
      print('Error registering: ${e.message}');
      // Handle the error accordingly, e.g., show a dialog to the user
    } catch (e) {
      print('Error registering: $e');
      rethrow;
    }
  }

  Future<void> signInWithEmailAndPassword(
      String email, String password, BuildContext context) async {
    try {
      await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const AppText()),
      );
    } on FirebaseAuthException catch (e) {
      print('Error signing in: ${e.message}');
      // Handle the error accordingly, e.g., show a dialog to the user
    } catch (e) {
      print('Error signing in: $e');
      rethrow;
    }
  }
}
