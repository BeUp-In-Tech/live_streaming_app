import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../core/theme/app_gradients.dart';
import 'splash_controller.dart';
import 'widgets/splash_logo.dart';
import 'widgets/loading_box.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(SplashController());

    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: AppGradients.background,
        ),
        child: SafeArea(
          child: LayoutBuilder(
            builder: (context, constraints) {
              final isLandscape = constraints.maxWidth > constraints.maxHeight;

              final logoWidth = isLandscape ? 420.0 : 320.0;
              final loadingWidth = isLandscape ? 520.0 : 320.0;

              return SingleChildScrollView(
                child: ConstrainedBox(
                  constraints: BoxConstraints(
                    minHeight: constraints.maxHeight,
                  ),
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.all(20),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            width: logoWidth,
                            child: const SplashLogo(),
                          ),
                          const SizedBox(height: 40),
                          SizedBox(
                            width: loadingWidth,
                            child: const LoadingBox(),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
