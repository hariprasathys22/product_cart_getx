import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:getx_flutter/app/routes/app_pages.dart';
import 'package:getx_flutter/app/services/cart_service.dart';
import 'package:getx_flutter/app/services/theme_service.dart';
import 'package:getx_flutter/app/services/translation.dart';

void main() async {
  await GetStorage.init();
  Get.put(CartService()); // Initialize CartController globally
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: "Product App",
      translations: AppTranslations(),
      themeMode: ThemeService().theme,
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      locale: Locale('en', 'US'),
      fallbackLocale: Locale('en', 'US'),
      initialRoute: Routes.PRODUCT,
      debugShowCheckedModeBanner: false,
      getPages: AppPages.routes,
    );
  }
}
