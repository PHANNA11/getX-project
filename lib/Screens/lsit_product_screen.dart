import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:getx_statemanagement/getx/product_getx_controller.dart';

class ListProductScreen extends StatelessWidget {
  ListProductScreen({Key? key}) : super(key: key);
  final ProductController productController = Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('List Product'),
      ),
      body: ListView.builder(
        itemCount: productController.products.length,
        itemBuilder: (context, index) {
          var pro = productController.products[index];
          return ListTile(
            leading: CircleAvatar(
              child: Text(pro.code.toString()),
            ),
            title: Text(
              pro.name,
              style: const TextStyle(fontSize: 25),
            ),
            subtitle: Text(pro.total.toString()),
          );
        },
      ),
    );
  }
}
