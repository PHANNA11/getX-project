import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

import '../model/product_model.dart';

class ProductController extends GetxController {
  var products = <Product>[].obs();
  addProductCard(Product product) {
    products.add(product);
    print('object added');
    update();
  }

  updateProductCard(Product pro) {}
}
