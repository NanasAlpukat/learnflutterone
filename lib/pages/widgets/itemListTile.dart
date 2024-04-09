import 'package:apps/controllers/userController.dart';
import 'package:apps/routers/nameRoute.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ItemsList extends StatelessWidget {
  // const ItemsList({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        Get.toNamed(NameRoute.edit);
      },
      leading: CircleAvatar(),
      title: Text(""),
      subtitle: Text(""),
      trailing: IconButton(
        onPressed: () {

        },
        icon: Icon(
          Icons.delete,
          color: Colors.red[600],
        ),
      ),
    );
  }
}
