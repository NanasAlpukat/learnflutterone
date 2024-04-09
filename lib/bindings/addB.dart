import 'package:apps/controllers/addController.dart';
import 'package:get/get.dart';



class AddUserB implements Bindings {
  @override
  void dependencies() {
    Get.put(AddC());
  }
}
