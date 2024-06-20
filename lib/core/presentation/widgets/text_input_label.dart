import 'package:flutter/material.dart';

import '../app_colors.dart';
import '../app_text_styles.dart';

class TextInputLabel extends StatelessWidget {
  const TextInputLabel({
    super.key,
    required this.label,
  });

  final String label;

  @override
  Widget build(BuildContext context) {
    return Text(
      label,
      style:
      const AppTextStyles().bodyText3.copyWith(color: AppColors.darkGrey),
      textAlign: TextAlign.start,
    );
  }
}