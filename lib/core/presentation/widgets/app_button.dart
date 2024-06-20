import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:svg_flutter/svg.dart';

import '../app_colors.dart';
import '../app_text_styles.dart';
import '../utils/app_assets.dart';

class AppButton extends StatelessWidget {
  const AppButton({super.key, required this.label, required this.onPressed});

  final VoidCallback onPressed;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 4.sw),
      child: MaterialButton(
        onPressed: onPressed,
        color: AppColors.purplePlum,
        splashColor: AppColors.turquoise,
        height: 6.5.sh,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              flex: 5,
              child: Container(
                height: 1,
              ),
            ),
            Text(
              label,
              style: const AppTextStyles()
                  .buttonText1
                  .copyWith(color: AppColors.white),
            ),
            Expanded(
              flex: 4,
              child: Container(
                height: 1,
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.all( 3.sw),
              child: SvgPicture.asset(
                AppAssets.arrowLongRight,
                colorFilter:
                    const ColorFilter.mode(Colors.white, BlendMode.srcIn),
              ),
            )
          ],
        ),
      ),
    );
  }
}
