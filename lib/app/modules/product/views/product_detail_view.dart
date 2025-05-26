import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_flutter/app/modules/product/controllers/cart_controller.dart';
import 'package:getx_flutter/app/modules/product/models/product_model.dart';

class ProductDetailView extends StatelessWidget {
  final CartController cartController = Get.find<CartController>();
  @override
  Widget build(BuildContext context) {
    final ProductModel product = Get.arguments;

    return Scaffold(
      appBar: AppBar(
        title: Text("Product Details"),
        actions: [
          IconButton(
            onPressed: () {
              Get.toNamed('/cart');
            },
            icon: Icon(Icons.shopping_cart),
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              product.title,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text('\$${product.price}', style: TextStyle(fontSize: 24)),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                cartController.addToCart(product);
                Get.snackbar(
                  "Added to cart",
                  '${product.title} added to your cart',
                  snackPosition: SnackPosition.BOTTOM,
                  duration: Duration(seconds: 2),
                  backgroundColor: Colors.amber,
                  colorText: Colors.white,
                );
              },
              child: Text("Add to Cart"),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Get.bottomSheet(
                  Container(
                    color: Colors.white,
                    child: Wrap(
                      children: [
                        ListTile(
                          leading: Icon(Icons.shopping_cart),
                          title: Text("View Cart"),
                          onTap: () {
                            Get.toNamed('/cart');
                          },
                        ),
                        ListTile(
                          leading: Icon(Icons.payment),
                          title: Text("Proceed to Checkout"),
                          onTap: () {
                            Get.toNamed('/checkout');
                          },
                        ),
                      ],
                    ),
                  ),
                );
              },
              child: Text("More Actions"),
            ),
          ],
        ),
      ),
    );
  }
}
