import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:silent_moon/data/response/status.dart';
import 'package:silent_moon/view_model/counter/controllers/counter_view_model.dart';

class UserListScreen extends StatefulWidget {
  const UserListScreen({super.key});

  @override
  State<UserListScreen> createState() => _UserListScreenState();
}

class _UserListScreenState extends State<UserListScreen> {
  late final CounterViewModel controller;
  @override
  void initState() {
    controller = Get.find();
    controller.getUsers();

    super.initState();
  }

  @override
  Widget build(context) {
    return Scaffold(
      appBar: AppBar(title: Text("Users")),
      body: Obx(() {
        switch (controller.usersStatus.value) {
          case Status.loading:
            return Center(child: CircularProgressIndicator());
          case Status.loaded:
            return ListView.builder(
              itemCount: controller.users.length,
              itemBuilder:
                  (context, index) => InkWell(
                    onTap: () {
                      context.go(
                        "/users/${controller.users[index].id ?? ""}",
                      );
                    },
                    child: ListTile(
                      leading: CircleAvatar(
                        backgroundImage: NetworkImage(
                          controller.users[index].avatar ?? "",
                        ),
                      ),
                      title: Text(controller.users[index].firstName ?? ""),
                      subtitle: Text(controller.users[index].email ?? ""),
                    ),
                  ),
            );
          case Status.error:
            return Center(child: Text("something went wrong"));
        }
      }),
    );
  }
}
