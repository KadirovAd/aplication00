import 'package:cloud_firestore/cloud_firestore.dart';


class UserModel {
  final String name;
  final String email;
  final Timestamp createdAt;

  UserModel({required this.name, required this.email, required this.createdAt});

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'email': email,
      'createdAt': createdAt,
    };
  }
}

class Entry {
  final String entryId;
  final String name;
  final String description;
  final Timestamp createdAt;

  Entry({
    required this.entryId,
    required this.name,
    required this.description,
    required this.createdAt,
  });
}

class Operation {
  final String operationId;
  final String name;
  final String description;
  final Timestamp createdAt;

  Operation({
    required this.operationId,
    required this.name,
    required this.description,
    required this.createdAt,
  });
}

// required this.uid,
// // 'id': uid,  
//// uid: map['uid'],