import 'package:apps/bindings/addB.dart';
import 'package:apps/bindings/editB.dart';
import 'package:apps/bindings/loginB.dart';
import 'package:apps/middlewares/authCheck.dart';
import 'package:apps/middlewares/loginCheck.dart';
import 'package:apps/pages/create.dart';
import 'package:apps/pages/dashboard.dart';
import 'package:apps/pages/edit.dart';
import 'package:apps/pages/home.dart';
import 'package:apps/pages/login.dart';
import 'package:apps/pages/student.dart';
import 'package:apps/routers/nameRoute.dart';
import 'package:get/get.dart';

class MyRouters {
  static var myRoutes = [
    GetPage(
      name: NameRoute.dashboard,
      page: () => Dashboard(),
      middlewares: [RoleCheck()],
    ),
    GetPage(
      name: NameRoute.home,
      page: () => Home(),
      
    ),
    GetPage(
      name: NameRoute.student,
      page: () => Student(),
    ),
    GetPage(
      name: NameRoute.create,
      page: () => Create(),
      binding: AddUserB(),
      middlewares: [AuthCheck()],
    ),
    GetPage(
      name: NameRoute.edit,
      page: () => Edit(),
      binding: EditB(),
      middlewares: [AuthCheck()],
    ),
    GetPage(
      name: NameRoute.login,
      page: () => Login(),
      binding: LoginB(),
      // middlewares: [LoginCheck()],
    ),
  ];
}
