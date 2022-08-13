import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/instance_manager.dart';
import 'package:getx_statemanagement/Screens/lsit_product_screen.dart';

import 'package:getx_statemanagement/Screens/screen2.dart';
import 'package:getx_statemanagement/getx/product_getx_controller.dart';
import 'package:getx_statemanagement/model/product_model.dart';

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
      //c  darkTheme: ThemeData.light(),
      // theme: ThemeData.dark(),
      theme: ThemeData(
          // primarySwatch: Colors.blue,
          ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  MyHomePage({Key? key}) : super(key: key);

  // var counter = 0.obs();
  // Controller controller = Get.put(Controller());
  TextEditingController nameController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  TextEditingController qtyController = TextEditingController();
  TextEditingController totoalController = TextEditingController();

  //---------------------------------
  ProductController productController = Get.put(ProductController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
          child: const Icon(Icons.bedtime),
          onTap: () {},
        ),
        title: const Text('Hello Getx'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                controller: nameController,
                decoration: const InputDecoration(
                    label: Text('product Name'), border: OutlineInputBorder()),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                controller: qtyController,
                decoration: const InputDecoration(
                    label: Text('product Quintity'),
                    border: OutlineInputBorder()),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                // onSaved: ((newValue) {
                //   int qty = int.parse(qtyController.text);
                //   double price = double.parse(priceController.text);
                //   totoalController.text = (price * qty).toString();
                // }),
                controller: priceController,
                decoration: const InputDecoration(
                    label: Text('product Price'), border: OutlineInputBorder()),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                //  enabled: false,
                controller: totoalController,
                decoration: const InputDecoration(
                    hintText: 'total', border: OutlineInputBorder()),
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            CupertinoButton(
                color: Theme.of(context).primaryColor,
                child: const Text('Next page'),
                onPressed: () => Get.to(() => ListProductScreen())),
          ],
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          CupertinoButton(
              color: Theme.of(context).primaryColor,
              child: const Text('save'),
              onPressed: () => productController.addProductCard(Product(
                    code: Random().nextInt(200),
                    name: nameController.text,
                    price: double.parse(priceController.text),
                    qty: int.parse(qtyController.text),
                    total: double.parse(totoalController.text),
                  ))),
          CupertinoButton(
              color: Theme.of(context).primaryColor,
              child: const Text('clear'),
              onPressed: () {}),
          // FloatingActionButton(
          //   heroTag: 'Decrement',
          //   onPressed: () => controller.decrement(),
          //   child: const Icon(Icons.remove),
          // ),
          // FloatingActionButton(
          //   heroTag: 'Increment',
          //   onPressed: () => controller.increment(),
          //   child: const Icon(Icons.add),
          // ),
        ],
      ),
    );
  }
}
