import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ActivationCodeBoxes extends StatefulWidget {
  final List<TextEditingController> controllers;

  const ActivationCodeBoxes({super.key, required this.controllers});

  @override
  State<ActivationCodeBoxes> createState() => _ActivationCodeBoxesState();
}

class _ActivationCodeBoxesState extends State<ActivationCodeBoxes> {

  late List<FocusNode> focusNodes;

  @override
  void initState() {
    super.initState();
    focusNodes = List.generate(widget.controllers.length, (_) => FocusNode());
  }

  void handleInput(String value, int index) {

    // Handle paste full code
    if (value.length > 1) {
      final chars = value.split('');

      for (int i = 0; i < widget.controllers.length; i++) {
        if (i < chars.length) {
          widget.controllers[i].text = chars[i];
        }
      }

      focusNodes.last.requestFocus();
      return;
    }

    // Move to next box
    if (value.isNotEmpty && index < focusNodes.length - 1) {
      focusNodes[index + 1].requestFocus();
    }

    // Backspace to previous
    if (value.isEmpty && index > 0) {
      focusNodes[index - 1].requestFocus();
    }
  }

  @override
  Widget build(BuildContext context) {

    final screenWidth = MediaQuery.of(context).size.width;

    final boxSize = ((screenWidth - 150) / widget.controllers.length)
        .clamp(32.0, 46.0);

    return FittedBox(
      fit: BoxFit.scaleDown,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(
          widget.controllers.length,
              (index) => Padding(
            padding: const EdgeInsets.symmetric(horizontal: 3),
            child: SizedBox(
              width: boxSize,
              height: boxSize,
              child: TextField(
                controller: widget.controllers[index],
                focusNode: focusNodes[index],
                textAlign: TextAlign.center,
                maxLength: 1,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                ),
                decoration: InputDecoration(
                  counterText: "",
                  filled: true,
                  fillColor: Colors.white.withOpacity(.06),
                  contentPadding: EdgeInsets.zero,

                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(
                      color: Colors.white.withOpacity(.25),
                      width: 1,
                    ),
                  ),

                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(
                      color: Colors.white.withOpacity(.25),
                      width: 1,
                    ),
                  ),

                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(
                      color: Colors.white,
                      width: 1.5,
                    ),
                  ),
                ),
                onChanged: (value) => handleInput(value, index),
              ),
            ),
          ),
        ),
      ),
    );
  }
}