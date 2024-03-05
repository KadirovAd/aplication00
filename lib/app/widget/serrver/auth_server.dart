import 'package:aplication000/app/page/Second_page.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:aplication000/app/widget/serrver/UserModel.dart';

class Auth {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  // FirebaseFirestore _firestore = FirebaseFirestore.instance;
  Future<void> signInWithEmailAndPassword(
      String email, String password, BuildContext context) async {
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      User? user = userCredential.user;
      if (user != null) {
        String userName = "";
        String uid = user.uid;
        UserModel userModel = UserModel(
          name: userName,
          email: user.email!,
          createdAt: Timestamp.now(),
        );
        await _firestore.collection('users').doc(uid).set(userModel.toMap());
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('User signed in successfully!'),
          ),
        );
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => AppText1(
              name: userModel.name,
              email: userModel.email,
              createdAt: userModel.createdAt,
            ),
          ),
        );
      }
    } on FirebaseAuthException catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error signing in: ${e.message}')),
      );
    } catch (e) {
      print('Error signing in: $e');
      rethrow;
    }
  }

  Future<void> registerWithEmailAndPassword(String email, String password,
      String userName, BuildContext context) async {
    try {
      UserCredential userCredential =
          await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      User? user = userCredential.user;
      if (user != null) {
        String uid = user.uid;
        UserModel userModel = UserModel(
          name: userName,
          email: user.email!,
          createdAt: Timestamp.now(),
        );
        await _firestore.collection('users').doc(uid).set(userModel.toMap());
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('User signed up successfully!'),
          ),
        );
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => AppText1(
              name: userModel.name,
              email: userModel.email,
              createdAt: userModel.createdAt,
            ),
          ),
        );
      }
    } on FirebaseAuthException catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error registering: ${e.message}')),
      );
    } catch (e) {
      print('Error registering: $e');
      rethrow;
    }
  }
}

