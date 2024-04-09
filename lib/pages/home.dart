import 'package:apps/controllers/auth/authController.dart';
import 'package:apps/controllers/userController.dart';
// import 'package:apps/pages/widgets/itemListTile.dart';
import 'package:apps/routers/nameRoute.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Home extends StatelessWidget {
  // const Home({ Key? key }) : super(key: key);
  final usersC = Get.find<UsersController>();
  final auth = Get.find<AuthController>();

  getData() async {
    await usersC.getData();
  }

  @override
  Widget build(BuildContext context) {
    // Get.reloadAll(force: true);
    getData();
    return Scaffold(
      appBar: AppBar(
        title: Text('All Items'),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              Get.toNamed(NameRoute.create);
            },
            icon: Icon(Icons.add),
          ),
        ],
      ),
      body: SafeArea(
        child: Obx(() => Padding(
              padding: EdgeInsets.all(20),
              child: usersC.users.isEmpty
                  ? Center(
                      child: Text("Belum ada data"),
                    )
                  : ListView.builder(
                      itemBuilder: (context, index) {
                        return ListTile(
                          leading: CircleAvatar(),
                          title: Text("${usersC.users[index].nama}"),
                          subtitle: Text("${usersC.users[index].email}"),
                          trailing: IconButton(
                            onPressed: () =>
                                usersC.delete(usersC.users[index].id),
                            icon: Icon(
                              Icons.delete_forever,
                              color: Colors.red[900],
                            ),
                          ),
                          onTap: () => Get.toNamed(
                            NameRoute.edit,
                            arguments: usersC.users[index].id,
                          ),
                        );
                      },
                      itemCount: usersC.users.length,
                    ),
            )),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          auth.deleteToken();
        },
        child: Text('Logout'),
      ),
    );
  }
}
