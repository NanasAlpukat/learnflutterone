import 'package:apps/controllers/auth/authController.dart';
import 'package:apps/pages/login.dart';
import 'package:apps/routers/nameRoute.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RoleCheck extends GetMiddleware {
  AuthController auth = AuthController();
  @override
  int? get priority => 1;

  @override
  RouteSettings? redirect(String? route) {
    var data = auth.hasToken();
    // data['isAuth'] = 'isActive';
    print('middleware ' + data['role'].toString());

    // if (data['isAuth'] != true) return RouteSettings(name: NameRoute.login);
    if (data['isAuth'] != false && data['role'] == 'admin') return RouteSettings(name: NameRoute.home);
    if (data['isAuth'] != false && data['role'] == 'siswa') return RouteSettings(name: NameRoute.student);
    // if (data == false) {
    //   return const RouteSettings(name: '/login');
    // }
    // Get.back();
    return RouteSettings(name: NameRoute.login);
  }
}
