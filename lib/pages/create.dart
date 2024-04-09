import 'package:apps/controllers/addController.dart';
import 'package:apps/controllers/userController.dart';
import 'package:apps/pages/widgets/input.dart';
import 'package:apps/routers/nameRoute.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Create extends StatelessWidget {
  // const Create({Key? key}) : super(key: key);
  final addC = Get.find<AddC>();
  final usersC = Get.find<UsersController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text('Create App'),
        ),
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.all(20),
            child: ListView(
              children: [
                TextField(
                  controller: addC.nama,
                  autocorrect: true,
                  textInputAction: TextInputAction.next,
                  decoration: InputDecoration(
                      labelText: 'Nama',
                      labelStyle: TextStyle(fontSize: 15),
                      hintText: 'Masukan nama',
                      border: OutlineInputBorder()),
                ),
                SizedBox(
                  height: 10,
                ),
                TextField(
                  controller: addC.email,
                  autocorrect: true,
                  keyboardType: TextInputType.emailAddress,
                  textInputAction: TextInputAction.next,
                  decoration: InputDecoration(
                      labelText: 'Email',
                      labelStyle: TextStyle(fontSize: 15),
                      hintText: 'Masukan email',
                      border: OutlineInputBorder()),
                ),
                SizedBox(
                  height: 10,
                ),
                TextField(
                  controller: addC.jk,
                  autocorrect: true,
                  textInputAction: TextInputAction.next,
                  decoration: InputDecoration(
                      labelText: 'Gender',
                      labelStyle: TextStyle(fontSize: 15),
                      hintText: 'Masukan gender',
                      border: OutlineInputBorder()),
                ),
                SizedBox(
                  height: 10,
                ),
                TextField(
                  controller: addC.agama,
                  autocorrect: true,
                  textInputAction: TextInputAction.next,
                  decoration: InputDecoration(
                      labelText: 'Agama',
                      labelStyle: TextStyle(fontSize: 15),
                      hintText: 'Masukan Agama',
                      border: OutlineInputBorder()),
                ),
                SizedBox(
                  height: 10,
                ),
                TextField(
                  controller: addC.alamat,
                  autocorrect: true,
                  textInputAction: TextInputAction.done,
                  decoration: InputDecoration(
                      labelText: 'Alamat',
                      labelStyle: TextStyle(fontSize: 15),
                      hintText: 'Masukan Alamat',
                      border: OutlineInputBorder()),
                  onEditingComplete: () => usersC.add(
                    addC.nama.text,
                    addC.email.text,
                    addC.jk.text,
                    addC.agama.text,
                    addC.alamat.text,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                ElevatedButton(
                  onPressed: () => usersC.add(
                    addC.nama.text,
                    addC.email.text,
                    addC.jk.text,
                    addC.agama.text,
                    addC.alamat.text,
                  ),
                  child: Text("ADD USER"),
                ),
              ],
            ),
          ),
        ));
  }
}
