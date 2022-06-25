import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ptirex/app/config/routes/app_pages.dart';
import 'package:ptirex/app/utils/core/authentification_manager.dart';

void main() {
  Get.put(AuthenticationManager());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'teeRex',
      locale: const Locale('fr', 'FR'),
      initialRoute: AppPages.initial,
      // getPages: AppPages.routes,
      onGenerateRoute: AppPages().generateRoute,
    );
  }
}
