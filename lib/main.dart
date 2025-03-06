import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:newsify/controller/auth_controller.dart';
import 'package:newsify/controller/theme_controller.dart';

import 'package:newsify/firebase_options.dart';
import 'package:newsify/routes/routes.dart';
import 'package:newsify/static/style/theme_data.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: ".env");
  await GetStorage.init();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  Get.put(AuthController(), permanent: true);
  Get.put(ThemeController(), permanent: true);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeController themeController = Get.find();
    return Obx(() {
      return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: '/',
        getPages: AppRoutes.routes,
        transitionDuration: Duration(milliseconds: 500),
        defaultTransition: Transition.size,
        theme: lightTheme,
        darkTheme: darkTheme,
        themeMode:
            themeController.isDarkMode.value ? ThemeMode.dark : ThemeMode.light,
      );
    });
  }
}
