import 'package:nagwa_task/core/core.dart';
import 'package:flutter/material.dart';

class CustomSearchBar extends StatelessWidget {
  /// A text that will be shown when the search bar is empty. If null, a 'Search' text will be shown.
  final String? hintText;

  /// A style that will be applied to the hint text.
  final TextStyle? hintStyle;

  /// A widget that will be shown before the text field.
  final Widget? leading;

  /// A callback that will be called when the user submits the search.
  final void Function(String value)? onSubmitted;

  /// A callback that will be called when the text in the search bar changes.
  final void Function(String value)? onChanged;

  /// A controller that will be used to control the text field.
  final TextEditingController? controller;
  const CustomSearchBar({
    super.key,
    this.hintText,
    this.hintStyle,
    this.leading,
    this.onSubmitted,
    this.onChanged,
    this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return SearchBar(
      controller: controller,
      hintText: hintText ?? 'Search',
      hintStyle: WidgetStatePropertyAll(hintStyle ?? AppTextStyles.font14SemiBoldGray),
      elevation: const WidgetStatePropertyAll(1),
      shape: const WidgetStatePropertyAll(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(AppConstants.kRadius10)),
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
