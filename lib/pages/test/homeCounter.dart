import 'package:apps/controllers/conuterController.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

class HomeCounter extends StatelessWidget {
  // const Home({ Key? key }) : super(key: key);
  final counterC = Get.put(CounterController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('home'),
        centerTitle: true,
      ),
      body: Center(
        child: Obx(() => Text('Angka  ${counterC.counter}')),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => counterC.increment(),
      ),
    );
  }
}
