import 'package:flutter/material.dart';
import 'package:svg_flutter/svg.dart';

import '../app_colors.dart';
import '../app_text_styles.dart';

class CustomTextField extends StatelessWidget {
  final String? labelText;
  final String hintText;
  final String icon;
  final String? errorText;
  final OutlineInputBorder? border;
  final Widget? suffixIcon;
  final TextEditingController? controller;

  const CustomTextField({
    super.key,
    required this.labelText,
    required this.hintText,
    required this.icon,
    this.controller,
    this.errorText,
    this.border,
    this.suffixIcon,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      enabled: true,
      cursorColor: AppColors.violet,
      cursorErrorColor: AppColors.alert,
      decoration: InputDecoration(
        fillColor: AppColors.lilacPetals,
        filled: true,
        hintText: hintText,
        labelStyle:
            const AppTextStyles().bodyText2.copyWith(color: AppColors.deepBlue),
        hintStyle:
            const AppTextStyles().bodyText2.copyWith(color: AppColors.darkGrey),
        prefixIcon: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 12),
          child: SvgPicture.asset(
            icon,
            colorFilter:
                const ColorFilter.mode(AppColors.darkGrey, BlendMode.srcIn),
          ),
        ),
        suffixIcon: suffixIcon,
        errorText: errorText,
        enabledBorder: border ??
            const OutlineInputBorder(
              borderSide:
                  BorderSide(color: AppColors.lilacPetalsDark, width: 1.5),
              borderRadius: BorderRadius.all(Radius.circular(14.0)),
            ),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.violet, width: 1.5),
          borderRadius: BorderRadius.all(Radius.circular(14.0)),
        ),
        focusedErrorBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.alert, width: 1.5),
          borderRadius: BorderRadius.all(Radius.circular(14.0)),
        ),
        errorBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.alert, width: 1.5),
          borderRadius: BorderRadius.all(Radius.circular(14.0)),
        ),
      ),
    );
  }
}
