import 'package:get/get.dart';
import 'package:getx_flutter/app/modules/product/views/product_detail_view.dart';
import 'package:getx_flutter/app/modules/product/views/product_view.dart';
part 'app_routes.dart';

class AppPages {
  static final routes = [
    GetPage(name: Routes.PRODUCT, page: () => ProductView()),
    GetPage(name: Routes.PRODUCT_DETAILS, page: () => ProductDetailView()),
  ];
}
