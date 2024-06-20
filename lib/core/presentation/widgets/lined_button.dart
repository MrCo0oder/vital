import 'package:flutter/material.dart';
import 'package:vital/core/presentation/app_colors.dart';
import 'package:vital/core/presentation/app_text_styles.dart';

class LinedButton extends StatelessWidget {
  const LinedButton({
    super.key,
    required this.label,
    required this.onPressed,
  });

  final VoidCallback onPressed;
  final String label;

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: onPressed,
      style: OutlinedButton.styleFrom(
          side: const BorderSide(color: AppColors.purplePlum)),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            textAlign: TextAlign.center,
            style: const AppTextStyles()
                .buttonText2
                .copyWith(color: AppColors.purplePlum),
          ),
        ],
      ),
    );
  }
}