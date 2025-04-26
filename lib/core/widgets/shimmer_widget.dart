export 'package:skeletonizer/skeletonizer.dart';
import 'package:nagwa_task/core/core.dart';
import 'package:flutter/material.dart';

class SkeletonizerWidget extends StatelessWidget {
  final Widget child;
  final PaintingEffect? effect;
  const SkeletonizerWidget({super.key, required this.child, this.effect});

  @override
  Widget build(BuildContext context) {
    return Skeletonizer(
      effect:
          effect ??
          PulseEffect(
            duration: const Duration(milliseconds: 600),
            from: AppColors.gray.withValues(alpha: 0.4),
            to: AppColors.gray.withValues(alpha: 0.8),
          ),
      child: child,
    );
  }
}
