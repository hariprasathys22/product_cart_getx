import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_flutter/app/routes/app_pages.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: "Product App",
      initialRoute: Routes.PRODUCT,
      debugShowCheckedModeBanner: false,
      getPages: AppPages.routes,
    );
  }
}
