import 'package:get/get.dart';
import 'package:getx_flutter/app/bindings/CartBinding.dart';
import 'package:getx_flutter/app/bindings/ProductBinding.dart';
import 'package:getx_flutter/app/modules/product/views/cart_view.dart';
import 'package:getx_flutter/app/modules/product/views/checkout_view.dart';
import 'package:getx_flutter/app/modules/product/views/product_detail_view.dart';
import 'package:getx_flutter/app/modules/product/views/product_view.dart';
part 'app_routes.dart';

class AppPages {
  static final routes = [
    GetPage(
      name: Routes.PRODUCT,
      page: () => ProductView(),
      binding: Productbinding(),
    ),
    GetPage(
      name: Routes.PRODUCT_DETAILS,
      page: () => ProductDetailView(),
      binding: CartBinding(),
    ),
    GetPage(name: Routes.CART, page: () => CartView()),
    GetPage(name: Routes.CHECKOUT, page: () => CheckoutView()),
  ];
}
