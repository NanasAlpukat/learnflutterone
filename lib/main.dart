import 'package:apps/controllers/auth/authController.dart';
import 'package:apps/controllers/userController.dart';
import 'package:apps/pages/home.dart';
import 'package:apps/pages/login.dart';
import 'package:apps/routers/myroutes.dart';
import 'package:apps/routers/nameRoute.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
// import 'package:get/get.dart';

void main() async {
  await GetStorage.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // const MyApp({ Key? key }) : super(key: key);
  final auth = Get.put(AuthController());
  final userC = Get.put(UsersController());

  @override
  // Widget build(BuildContext context) {
  //   return Obx(() => GetMaterialApp(
  //     debugShowCheckedModeBanner: false,
  //     home: auth.authCheck.isTrue ?  Home() : Login(),
  //     getPages: MyRouters.myRoutes,
  //   ));

  // }
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      // home: Home(),
      initialRoute: NameRoute.dashboard,
      getPages: MyRouters.myRoutes,
    );
  }
}
