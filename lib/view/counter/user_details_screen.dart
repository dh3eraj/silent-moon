import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:silent_moon/data/response/status.dart';
import 'package:silent_moon/view_model/counter/controllers/counter_view_model.dart';

class UserDetailsScreen extends StatefulWidget {
  final int userId;
  const UserDetailsScreen({super.key, required this.userId});

  @override
  State<UserDetailsScreen> createState() => _UserDetailsScreenState();
}

class _UserDetailsScreenState extends State<UserDetailsScreen> {
  late final CounterViewModel controller;
  @override
  void initState() {
    controller = Get.find();
    controller.getUserById(widget.userId);
    super.initState();
  }

  @override
  Widget build(context) {
    return Material(
      child: Obx(() {
        switch (controller.userStatus.value) {
          case Status.loading:
            return Center(child: CircularProgressIndicator());
          case Status.loaded:
            return Scaffold(
              appBar: AppBar(
                title: Text(controller.currentUser.firstName ?? ""),
              ),
              body: InkWell(
                onTap: () {
                  context.go("/users/${widget.userId}/chat");
                },
                child: ListTile(
                  leading: CircleAvatar(
                    backgroundImage: NetworkImage(
                      controller.currentUser.avatar ?? "",
                    ),
                  ),
                  title: Text(
                    "${controller.currentUser.firstName ?? ""} ${controller.currentUser.lastName ?? ""}",
                  ),
                  subtitle: Text(controller.currentUser.email ?? ""),
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
