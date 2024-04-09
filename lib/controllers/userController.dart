// import 'dart:convert';

import 'package:apps/controllers/auth/authController.dart';
import 'package:apps/models/usersModels.dart';
import 'package:apps/providers/userProvider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UsersController extends GetxController {
  var users = List<User>.empty().obs;
  AuthController auth = AuthController();
  @override
  void onInit() {
    super.onInit();
    getData();
  }

  void snackBarErrors(String msg) {
    Get.snackbar("Error", msg, duration: Duration(seconds: 2));
  }

  Future getData() async {
    var token = await auth.hasToken();
    print(token);
    if (token['isAuth'] != null) {
      if (token['token'] != '' && token['isAuth'] != false) {
        UserProvider().getDataUser(token['token']).then((data) {
          print(data.body);
          Iterable it = data.body['data'];
          users.value = it.map((data) => User.createUser(data)).toList();
          return users;
        });
      } else {
        print('maaf data error');
      }
    } else {
      print('maaf data tidak ada');
    }
  }

  void add(String nama, String email, String jk, String alamat, String agama) {
    if (nama != '' && email != '' && jk != '' && alamat != '' && agama != '') {
      if (email.contains('@')) {
        UserProvider().postData(nama, email, jk, alamat, agama).then((data) {
          try {
            if (data.statusCode == 200) {
              users.add(User(
                  id: data.body['data']['id'],
                  nama: nama,
                  email: email,
                  jk: jk,
                  alamat: alamat,
                  agama: agama));
              // ignore: invalid_use_of_protected_member
              // users.value.add(User.createUser(data.body['data']));
              Get.back();
            }
          } catch (e) {
            snackBarErrors(e.toString());
          }
        });
      } else {
        snackBarErrors("Masukan email valid");
      }
    } else {
      snackBarErrors("Semua data harus di isi");
    }
  }

  User userById(dynamic id) {
    return users.firstWhere((data) => data.id == id);
  }

  void edit(dynamic id, String nama, String email, String jk, String alamat,
      String agama) {
    if (id != '' &&
        nama != '' &&
        email != '' &&
        jk != '' &&
        alamat != '' &&
        agama != '') {
      if (email.contains('@')) {
        UserProvider().putData(id, nama, email, jk, alamat, agama).then((data) {
          try {
            if (data.statusCode == 200) {
              // print(data.body);
              final user = userById(id);
              user.nama = nama;
              user.email = email;
              user.jk = jk;
              user.alamat = alamat;
              user.agama = agama;
              users.refresh();
              Get.back();
            }
          } catch (e) {
            snackBarErrors(e.toString());
          }
        });
      } else {
        snackBarErrors("Masukan email valid");
      }
    } else {
      snackBarErrors("Semua data harus di isi");
    }
  }

  Future<bool> delete(dynamic id) async {
    bool _deleted = false;
    await Get.defaultDialog(
      title: "DELETE",
      middleText: "Apakah kamu yakin untuk menghapus data user ini?",
      textConfirm: "Ya",
      confirmTextColor: Colors.white,
      onConfirm: () {
        UserProvider().deleteData(id).then((value) {
          users.removeWhere((element) => element.id == id);
          _deleted = true;
          Get.back();
        });
      },
      textCancel: "Tidak",
    );
    return _deleted;
  }
}
