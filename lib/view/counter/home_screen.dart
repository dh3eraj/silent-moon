import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:silent_moon/config/routes.dart';
import 'package:silent_moon/view_model/counter/controllers/counter_view_model.dart';

class HomeScreen extends GetView<CounterViewModel> {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("counter")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Obx(() => Text('clicks: ${controller.count.value}')),
            ElevatedButton(
              child: Text('Next Route'),
              onPressed: () {
                Get.toNamed(AppRoutes.secondScreen);
              },
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          controller.incrementCounter();
          controller.getUserById(controller.count.value);
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
