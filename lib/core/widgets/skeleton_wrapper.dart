import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';

class SkeletonWrapper extends StatelessWidget {

  final bool enabled;
  final Widget child;

  const SkeletonWrapper({
    super.key,
    required this.enabled,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {

    return Skeletonizer(
      enabled: enabled,
      effect: const ShimmerEffect(
        baseColor: Colors.white12,
        highlightColor: Colors.white24,
      ),
      child: child,
    );
  }
}