// ignore_for_file: use_build_context_synchronously

import 'package:aplication000/app/models/user_models/UserModel.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../views/chat_view.dart';

class Auth {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> signInWithEmailAndPassword(
      String email, String password, BuildContext context) async {
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      User? user = userCredential.user;
      if (user != null) {
        String userName = "Some Name";
        String uid = user.uid;
        UserModel userModel = UserModel(
          name: userName,
          email: user.email!,
          createdAt: Timestamp.now(),
        );
        await _firestore.collection('users').doc(uid).set(userModel.toMap());
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Пользователь успешно вошел в систему!'),
          ),
        );
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => UserModelText(
              name: userModel.name,
              email: userModel.email,
              createdAt: Timestamp.now().toDate(),
            ),
          ),
        );
      }
    } on FirebaseAuthException catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Ошибка входа: ${e.message}')),
      );
    } catch (e) {
      print('Ошибка входа: $e');
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
            content: Text('Пользователь успешно зарегистрирован!'),
          ),
        );
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => UserModelText(
              name: userModel.name,
              email: userModel.email,
              createdAt: Timestamp.now().toDate(),
            ),
          ),
        );
      }
    } on FirebaseAuthException catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Ошибка регистрации: ${e.message}')),
      );
    } catch (e) {
      print('Ошибка регистрации: $e');
      rethrow;
    }
  }
}
