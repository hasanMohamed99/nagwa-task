import 'package:nagwa_task/core/core.dart';
import 'package:flutter/material.dart';
import 'dart:ui';

class CustomScrollBehavior extends MaterialScrollBehavior {
  @override
  Set<PointerDeviceKind> get dragDevices => {PointerDeviceKind.touch};

  @override
  Widget buildOverscrollIndicator(BuildContext context, Widget child, ScrollableDetails details) {
    final AndroidOverscrollIndicator indicator =
        Theme.of(context).useMaterial3
            ? AndroidOverscrollIndicator.glow
            : AndroidOverscrollIndicator.stretch;
    switch (getPlatform(context)) {
      case TargetPlatform.iOS:
      case TargetPlatform.linux:
      case TargetPlatform.macOS:
      case TargetPlatform.windows:
        return child;
      case TargetPlatform.android:
        switch (indicator) {
          case AndroidOverscrollIndicator.stretch:
            return StretchingOverscrollIndicator(
              axisDirection: details.direction,
              clipBehavior: details.decorationClipBehavior ?? Clip.hardEdge,
              child: child,
            );
          case AndroidOverscrollIndicator.glow:
            break;
        }
      case TargetPlatform.fuchsia:
        break;
    }
    return GlowingOverscrollIndicator(
      axisDirection: details.direction,
      color: AppColors.primaryColor,
      child: child,
    );
  }
}
