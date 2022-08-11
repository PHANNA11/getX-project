import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/instance_manager.dart';

import 'package:getx_statemanagement/Screens/screen2.dart';

import 'getx/getx_controller.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  MyHomePage({Key? key}) : super(key: key);

  var counter = 0.obs();
  Controller controller = Get.put(Controller());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Hello Getx'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GetBuilder<Controller>(
              builder: (_) => Text(
                '${controller.counter}',
                style: const TextStyle(fontSize: 30),
              ),
            ),
            CupertinoButton(
                color: Theme.of(context).primaryColor,
                child: const Text('Next page'),
                onPressed: () => Get.to(() => const Screen2())),
          ],
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          FloatingActionButton(
            heroTag: 'Decrement',
            onPressed: () => controller.decrement(),
            child: const Icon(Icons.remove),
          ),
          FloatingActionButton(
            heroTag: 'Increment',
            onPressed: () => controller.increment(),
            child: const Icon(Icons.add),
          ),
        ],
      ),
    );
  }
}
