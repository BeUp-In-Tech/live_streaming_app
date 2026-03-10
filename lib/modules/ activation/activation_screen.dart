import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_gradients.dart';
import '../../core/widgets/glass_container.dart';
import 'activation_controller.dart';
import 'widgets/activation_button.dart';
import 'widgets/activation_code_boxes.dart';
import 'widgets/instruction_card.dart';

class ActivationScreen extends StatelessWidget {
  const ActivationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ActivationController());

    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Container(
        decoration: const BoxDecoration(
          gradient: AppGradients.background,
        ),
        child: SafeArea(
          child: LayoutBuilder(
            builder: (context, constraints) {

              return SingleChildScrollView(
                child: ConstrainedBox(
                  constraints: BoxConstraints(
                    minHeight: constraints.maxHeight,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Center(
                      child: ConstrainedBox(
                        constraints: const BoxConstraints(maxWidth: 600),
                        child: Column(
                          children: [

                            const SizedBox(height: 10),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [

                                Image.asset(
                                  "assets/images/logo.png",
                                  height: 50,
                                ),

                                const SizedBox(width: 10),

                                Text.rich(
                                  TextSpan(
                                    children: [
                                      const TextSpan(
                                        text: "Uzza ",
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      TextSpan(
                                        text: "Max",
                                        style: TextStyle(
                                          color: AppColors.primary500,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                  style: const TextStyle(fontSize: 24),
                                ),

                              ],
                            ),
                            const SizedBox(height: 20),

                            const Text(
                              "Activate Device",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 30,
                                fontWeight: FontWeight.w500,
                              ),
                            ),

                            const SizedBox(height: 10),

                            const Text(
                              "Enter the 7-digit activation code shown on your TV screen to link your account.",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.white70,
                              ),
                            ),

                            const SizedBox(height: 30),

                            GlassContainer(
                              child: Column(
                                children: [

                                  ActivationCodeBoxes(
                                    controllers: controller.controllers,
                                  ),

                                  const SizedBox(height: 25),

                                  ActivationButton(
                                    onTap: controller.connectDevice,
                                  )

                                ],
                              ),
                            ),

                            const SizedBox(height: 30),

                            const InstructionCard(
                              icon: Icons.tv,
                              title: "1. Open App on TV",
                              description:
                              "Navigate to the 'Settings' or 'Login' section on your TV device.",
                            ),

                            const SizedBox(height: 20),

                            const InstructionCard(
                              icon: Icons.code,
                              title: "2. Get Your Code",
                              description:
                              "A unique activation code will appear automatically on your screen.",
                            ),

                            const SizedBox(height: 40),

                            RichText(
                              text: TextSpan(
                                style: const TextStyle(
                                  color: Colors.white70,
                                  fontSize: 14,
                                ),
                                children: [
                                  TextSpan(
                                    text: "Need help",
                                    style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: AppColors.primary500,
                                    ),
                                    recognizer: TapGestureRecognizer()
                                      ..onTap = () {
                                        // TODO: open help page or dialog
                                      },
                                  ),
                                  const TextSpan(
                                    text: " finding your code?",
                                  ),
                                ],
                              ),
                            ),

                            const SizedBox(height: 40),

                          ],
                        ),
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