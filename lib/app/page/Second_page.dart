import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class AppText1 extends StatelessWidget {
  final String name;
  final String email;
  final Timestamp createdAt;

  AppText1({
    required this.name,
    required this.email,
    required this.createdAt,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('User Profile'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Name: $name'),
          Text('Email: $email'),
          Text('Created At: $createdAt'),
          FutureBuilder<DocumentSnapshot>(
            future: FirebaseFirestore.instance
                .collection('your_collection')
                .doc('your_document')
                .get(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return CircularProgressIndicator();
              }
              if (snapshot.hasError) {
                return Text('Error: ${snapshot.error}');
              }
              if (!snapshot.hasData || !snapshot.data!.exists) {
                return Text('No Data');
              }
              var data = snapshot.data!.data();
              return Text('Firestore Data: ${data.toString()}');
            },
          ),
        ],
      ),
    );
  }
}
