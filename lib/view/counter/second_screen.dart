import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:silent_moon/data/response/status.dart';
import 'package:silent_moon/view_model/counter/controllers/counter_view_model.dart';

class SecondScreen extends StatefulWidget {
  const SecondScreen({super.key});

  @override
  State<SecondScreen> createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
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
      appBar: AppBar(title: Text("count : ${controller.count}")),

      body: Obx(() {
        switch (controller.status.value) {
          case Status.loading:
            log("switch : loading");
            return Center(child: CircularProgressIndicator());
          case Status.loaded:
            log("switch : loaded");
            return ListView.builder(
              itemCount: controller.users.length,
              itemBuilder:
                  (context, index) => ListTile(
                    title: Text(controller.users[index].firstName ?? ""),
                  ),
            );
          default:
            log("switch : default");

            return Container();
        }
      }),
    );
  }
}
