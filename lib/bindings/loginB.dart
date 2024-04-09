import 'package:apps/controllers/auth/authController.dart';
import 'package:get/get.dart';



class LoginB implements Bindings {
  @override
  void dependencies() {
    Get.put(AuthController());
  }
}
