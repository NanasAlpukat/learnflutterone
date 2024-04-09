import 'package:apps/controllers/editController.dart';
import 'package:get/get.dart';



class EditB implements Bindings {
  @override
  void dependencies() {
    Get.put(EditC());
  }
}
