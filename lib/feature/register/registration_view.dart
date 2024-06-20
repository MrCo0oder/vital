import 'package:flutter/material.dart';
import 'package:vital/core/presentation/app_colors.dart';
import 'package:vital/core/presentation/app_text_styles.dart';
import 'package:vital/core/presentation/utils/app_assets.dart';
import 'package:vital/core/presentation/utils/app_strings.dart';
import 'package:vital/core/presentation/widgets/app_button.dart';
import 'package:vital/core/presentation/widgets/spacers.dart';

import '../../core/presentation/widgets/custom_text_field.dart';
import '../../core/presentation/widgets/text_input_label.dart';

class RegistrationView extends StatelessWidget {
  const RegistrationView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        minimum: EdgeInsets.symmetric(horizontal: h24px()),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              vXXXl(),
              Text(
                AppStrings.createAnAccount,
                style: const AppTextStyles()
                    .headline1
                    .copyWith(color: AppColors.deepBlue),
                textAlign: TextAlign.center,
              ),
              vXl(),
              const TextInputLabel(
                label: AppStrings.fullName,
              ),
              const CustomTextField(
                labelText: null,
                hintText: AppStrings.enterUrName,
                icon: AppAssets.person,
              ),
              vM(),
              const TextInputLabel(
                label: AppStrings.e_mail,
              ),
              const CustomTextField(
                labelText: null,
                hintText: AppStrings.enterUrEmail,
                icon: AppAssets.email,
              ),
              vM(),
              const TextInputLabel(
                label: AppStrings.password,
              ),
              const CustomTextField(
                labelText: null,
                hintText: AppStrings.enterUrPassword,
                icon: AppAssets.locked,
              ),
              vXl(),
              AppButton(label: AppStrings.signUp, onPressed: () {}),
              vXXXl(),
            ],
          ),
        ),
      ),
    );
  }
}
