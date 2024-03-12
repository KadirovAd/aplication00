import 'package:flutter/material.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({
    Key? key,
    required this.userModel,
  }) : super(key: key);

  final UserModel userModel;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
            child: CircleAvatar(
              backgroundColor: Colors.white,
              radius: 30,
              child: Icon(
                Icons.person,
                size: 80,
                color: Colors.blue,
              ),
            ),
          ),
          ListTile(
            title: Text('Name'),
            subtitle: Text(userModel.name),
          ),
          ListTile(
            title: Text('Email'),
            subtitle: Text(userModel.email),
          ),
          ListTile(
            title: Text('Time your WhatsApp'),
            subtitle: Text(userModel.createdAt.toString()),
          ),
        ],
      ),
    );
  }
}

class UserModel {
  final String name;
  final String email;
  final DateTime createdAt;

  UserModel({
    required this.name,
    required this.email,
    required this.createdAt,
  });
}
