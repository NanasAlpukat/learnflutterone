import 'package:get/get.dart';
import 'package:flutter/material.dart';

class AddC extends GetxController {
  late TextEditingController nama;
  late TextEditingController email;
  late TextEditingController jk;
  late TextEditingController agama;
  late TextEditingController alamat;

// otomatis di buat atau di inisialisasi
  @override
  void onInit() {
    super.onInit();
    nama = TextEditingController();
    email = TextEditingController();
    jk = TextEditingController();
    agama = TextEditingController();
    alamat = TextEditingController();
  }

// otomatis di hapus atau di uninisialisasi
  @override
  void onClose() {
    nama.dispose();
    email.dispose();
    jk.dispose();
    agama.dispose();
    alamat.dispose();
    super.onClose();
  }
}
