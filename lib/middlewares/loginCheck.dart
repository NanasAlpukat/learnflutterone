import 'package:apps/controllers/auth/authController.dart';
import 'package:apps/pages/login.dart';
import 'package:apps/routers/nameRoute.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuthCheck extends GetMiddleware {
  AuthController auth = AuthController();
  @override
  int? get priority => 2;

  @override
  RouteSettings? redirect(String? route) {
    var data = auth.hasToken();
    // data['isAuth'] = 'isActive';
    // print('middleware role ' + data['role'].toString());

    if (data['isAuth'] != true) return RouteSettings(name: NameRoute.login);
    // if (data['role'] == 'admin') return RouteSettings(name: NameRoute.home);
    // if (data['role'] == 'siswa') return RouteSettings(name: NameRoute.student);
    // if (data == false) {
    //   return const RouteSettings(name: '/login');
    // }
    // Get.back();
    // return null;
    // return RouteSettings(name: NameRoute.student);
  }
}
