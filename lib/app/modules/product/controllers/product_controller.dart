import 'package:get/get.dart';
import 'package:getx_flutter/app/modules/product/models/product_model.dart';
import 'package:getx_flutter/app/services/product_service.dart';

class ProductController extends GetxController {
  var productList = <ProductModel>[].obs;
  var errorMessage = ''.obs;
  var isLoading = true.obs;

  final ProductService productService;
  ProductController({required this.productService});
  @override
  void onInit() {
    super.onInit();
    fetchProducts();
  }

  void fetchProducts() async {
    try {
      isLoading(true);
      errorMessage('');
      var products = await productService.fetchProducts();
      productList.assignAll(products);
    } catch (e) {
      errorMessage('Failed to load products: $e');
    } finally {
      isLoading(false);
    }
  }
}
