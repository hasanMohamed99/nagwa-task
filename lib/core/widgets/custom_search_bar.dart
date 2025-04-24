import 'package:nagwa_task/core/core.dart';
import 'package:flutter/material.dart';

class CustomSearchBar extends StatelessWidget {
  final String? hintText;
  final TextStyle? hintStyle;
  final Widget? leading;
  final void Function(String)? onSubmitted;
  final void Function(String)? onChanged;
  const CustomSearchBar({
    super.key,
    this.hintText,
    this.hintStyle,
    this.leading,
    this.onSubmitted,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return SearchBar(
      hintText: hintText ?? 'Search',
      hintStyle: WidgetStatePropertyAll(hintStyle ?? AppTextStyles.font14SemiBoldGray),
      elevation: const WidgetStatePropertyAll(1),
      shape: const WidgetStatePropertyAll(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(AppConstants.kRadius25)),
          side: BorderSide(color: AppColors.secondGray),
        ),
      ),
      padding: const WidgetStatePropertyAll(
        EdgeInsets.symmetric(horizontal: AppConstants.kHorizontalPadding10),
      ),
      leading: leading ?? const Icon(Icons.search, size: 25, color: AppColors.gray),
      textInputAction: TextInputAction.search,
      keyboardType: TextInputType.text,
      onSubmitted: onSubmitted,
      onTapOutside: (event) {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      onChanged: onChanged,
      overlayColor: const WidgetStatePropertyAll(AppColors.transparent),
    );
  }
}
