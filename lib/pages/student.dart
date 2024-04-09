import 'package:apps/controllers/auth/authController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Student extends StatelessWidget {
   final auth = Get.find<AuthController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Student'),
      ),
      body: Center(
        child: Text('Student'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          auth.deleteToken();
        },
        child: Text('Logout'),
      ),
    );
  }
}
