import 'package:get/get.dart';
// import 'package:getx_flutter/app/modules/product/controllers/cart_controller.dart';
import 'package:getx_flutter/app/modules/product/controllers/product_controller.dart';
import 'package:getx_flutter/app/services/product_service.dart';

class Productbinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ProductService>(() => ProductService());
    Get.lazyPut<ProductController>(
      () => ProductController(productService: Get.find<ProductService>()),
    );
  }
}
