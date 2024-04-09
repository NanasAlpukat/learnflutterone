// import 'package:apps/controllers/userController.dart';

import 'package:apps/controllers/userController.dart';
import 'package:apps/providers/authProvider.dart';
import 'package:apps/routers/nameRoute.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
// import 'package:shared_preferences/shared_preferences.dart';

class AuthController extends GetxController {
  late TextEditingController email;
  late TextEditingController password;
  // ignore: non_constant_identifier_names
  // UsersController users = UsersController();
  var token_jwt;
  var authCheck = false.obs;

  @override
  void onInit() {
    super.onInit();
    hasToken();

    email = TextEditingController();
    password = TextEditingController();
  }

  @override
  void onClose() {
    email.dispose();
    password.dispose();
    super.onClose();
  }

  void snackBarErrors(String msg) {
    Get.snackbar("Error", msg, duration: Duration(seconds: 2));
  }

  void login(String email, String password) {
    if (password != '' && email != '') {
      if (email.contains('@')) {
        AuthProvider().login(email, password).then((data) {
          try {
            // print(role);

            var token = data.body['data'];
            if (token != null) {
              authCheck.value = true;

              var role = data.body['user']['roles'];
              setLocalToken(token, 'active',role);
              Get.offNamed(NameRoute.dashboard);
              // UsersController().getData();

            }
          } catch (e) {
            snackBarErrors(e.toString());
          }
        });
      } else {
        snackBarErrors("Inputan ini harus email");
      }
    } else {
      snackBarErrors("Semua data harus di isi");
    }
  }

  hasToken() {
    final box = GetStorage();
    String? token = box.read('token');
    String? auth = box.read('isAuth');
    String? role = box.read('role');
    token_jwt = token ?? '';
    bool check =
        (auth == 'active' ? authCheck.value = true : authCheck.value = false);
    print(check);
    Map<String, dynamic> params = {
      'token': token_jwt,
      'isAuth': check,
      'role': role,
    };

    if (params != {}) return params;
    return '';
    // Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
    // final SharedPreferences local = await _prefs;
    // // SharedPreferences prefs = await SharedPreferences.getInstance();

    // String token = local.getString("token") ?? '';
    // // print(token_jwt);
    // if (token != '') return token;
    // return '';
  }

  void setLocalToken(String token, String auth, String role) {
    final box = GetStorage();
    box.write('token', token);
    box.write('isAuth', auth);
    box.write('role', role);
    // Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
    // final SharedPreferences local = await _prefs;
    // local.setString('token', token);
    // // print(token_jwt);
  }

  void deleteToken() {
    final box = GetStorage();
    box.remove('token');
    box.remove('isAuth');
    box.remove('role');
    authCheck.value = false;
    Get.offNamed(NameRoute.login);
    // Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
    // final SharedPreferences local = await _prefs;
    // local.setString('token', '');
    // // print(token_jwt);
  }
}
