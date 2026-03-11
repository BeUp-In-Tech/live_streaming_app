import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'core/theme/app_theme.dart';
import 'modules/splash/splash_screen.dart';

class UzzaMaxApp extends StatelessWidget {
  const UzzaMaxApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: "Uzza Max",
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      home: const SplashScreen(),
    );
  }
}
