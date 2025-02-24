import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:silent_moon/view_model/counter/controllers/counter_view_model.dart';

class SecondScreen extends GetView<CounterViewModel>{
  const SecondScreen({super.key});

  @override
  Widget build(context) {
    return Scaffold(body: Center(child: Text("${controller.count}")));
  }
}