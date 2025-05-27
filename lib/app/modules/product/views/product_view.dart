import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_flutter/app/modules/product/controllers/product_controller.dart';
import 'package:getx_flutter/app/services/theme_service.dart';

class ProductView extends StatelessWidget {
  final ProductController productController = Get.find<ProductController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('product_list'.tr),
        actions: [
          IconButton(
            onPressed: () {
              if (Get.locale == Locale('en', 'US')) {
                Get.updateLocale(Locale('es', 'ES'));
              } else {
                Get.updateLocale(Locale('en', 'US'));
              }
            },
            icon: Icon(Icons.language),
          ),
          IconButton(
            onPressed: () {
              ThemeService().switchTeme();
            },
            icon: Icon(Icons.brightness_6),
          ),
        ],
      ),
      body: Obx(() {
        if (productController.isLoading.value) {
          return Center(child: CircularProgressIndicator());
        }

        if (productController.errorMessage.isNotEmpty) {
          return Center(child: Text(productController.errorMessage.value));
        }
        return ListView.builder(
          itemCount: productController.productList.length,
          itemBuilder: (context, index) {
            final product = productController.productList[index];
            return ListTile(
              title: Text(product.title),
              subtitle: Text('\$${product.price.toString()}'),
              onTap: () {
                Get.toNamed('/product-details', arguments: product);
              },
            );
          },
        );
      }),
    );
  }
}
