import 'package:flutter/material.dart';
import '../theming/app_colors.dart';
import '../theming/app_text_styles.dart';

showSnackBar({
  required BuildContext context,
  required String title,
  required SnackBarType type,
  Duration? duration,
  SnackBarBehavior? behavior,
}) {
  ScaffoldMessenger.of(context).clearSnackBars();
  return ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(
        title,
        style: AppTextStyles.font14Medium.copyWith(color: AppColors.white),
        maxLines: 3,
      ),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      backgroundColor: _getColorFromType(type),
      duration: duration ?? const Duration(seconds: 5),
      behavior: behavior ?? SnackBarBehavior.floating,
    ),
  );
}

enum SnackBarType { success, error, warning }

dynamic _getColorFromType(SnackBarType type) {
  switch (type) {
    case SnackBarType.success:
      return AppColors.darkGreen;
    case SnackBarType.error:
      return AppColors.red;
    case SnackBarType.warning:
      return AppColors.orange;
  }
}
