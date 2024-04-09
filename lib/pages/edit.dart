import 'package:apps/controllers/editController.dart';
import 'package:apps/controllers/userController.dart';
import 'package:apps/models/usersModels.dart';
import 'package:apps/pages/widgets/input.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Edit extends StatelessWidget {
  final editC = Get.find<EditC>();
  final userC = Get.find<UsersController>();
  final dynamic uid = Get.arguments;

  @override
  Widget build(BuildContext context) {
    final User user = userC.userById(uid);
    editC.nama.text = user.nama!;
    editC.email.text = user.email!;
    editC.jk.text = user.jk!;
    editC.agama.text = user.agama!;
    editC.alamat.text = user.alamat!;

    return Scaffold(
        appBar: AppBar(
          title: Text('Update Items'),
          centerTitle: true,
          actions: [
            IconButton(
              onPressed: () => userC.delete(uid).then(
                (deleted) {
                  if (deleted) Get.back();
                },
              ),
              icon: Icon(Icons.delete_forever),
            ),
          ],
        ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: ListView(
              children: [
                TextField(
                  controller: editC.nama,
                  autocorrect: false,
                  textInputAction: TextInputAction.next,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                TextField(
                  controller: editC.email,
                  autocorrect: false,
                  keyboardType: TextInputType.emailAddress,
                  textInputAction: TextInputAction.next,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                TextField(
                  controller: editC.jk,
                  autocorrect: false,
                  textInputAction: TextInputAction.next,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                TextField(
                  controller: editC.agama,
                  autocorrect: false,
                  textInputAction: TextInputAction.next,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                TextField(
                  controller: editC.alamat,
                  autocorrect: false,
                  textInputAction: TextInputAction.done,
                  // keyboardType: TextInputType.phone,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                  ),
                  onEditingComplete: () => userC.edit(
                    uid,
                    editC.nama.text,
                    editC.email.text,
                    editC.jk.text,
                    editC.agama.text,
                    editC.alamat.text,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                ElevatedButton(
                  onPressed: () => userC.edit(
                    uid,
                    editC.nama.text,
                    editC.email.text,
                    editC.jk.text,
                    editC.agama.text,
                    editC.alamat.text,
                  ),
                  child: Text("UPDATE"),
                ),
              ],
            ),
          ),
        ));
  }
}
